using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Reclaim_the_art.Areas.Customer.Models;
using System.Data;

namespace Reclaim_the_art.Areas.Customer.Controllers
{
    [Area("Customer")]
    [Route("Customer/[controller]/[action]")]
    public class CustomerController : Controller
    {
        #region Connection String
        private IConfiguration Configuration;
        public CustomerController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }
        #endregion

        #region SelectAll
        public IActionResult Index()
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_Customer_SelectAll";
            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            return View("CustomerList" ,dt);
        }
        #endregion

        #region DELETE
        public IActionResult Delete(int CustomerID)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_Customer_DeleteByPK";
            cmd.Parameters.AddWithValue("@CustomerID", CustomerID);
            cmd.ExecuteNonQuery();
            Connect.Close();
            return RedirectToAction("Index");

        }
        #endregion

        #region CANCLE
        public IActionResult Cancle()
        {
            return RedirectToAction("Index");
        }
        #endregion

        #region ADD
        public IActionResult Add(int? CustomerID)
        {

            if (CustomerID != null)
            {

                string str = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection Connect = new SqlConnection(str);
                Connect.Open();
                SqlCommand cmd = Connect.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_Customer_SelectByPK";
                cmd.Parameters.Add("@CustomerID", SqlDbType.Int).Value = CustomerID;
                DataTable dt = new DataTable();
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
                CustomerModel modelCustomer = new CustomerModel();

                foreach (DataRow dr in dt.Rows)
                {
                    modelCustomer.CustomerID = Convert.ToInt32(dr["CustomerID"]);
                    modelCustomer.CustomerName = dr["CustomerName"].ToString();
                    modelCustomer.CustomerPassword = dr["CustomerPassword"].ToString();
                    modelCustomer.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                    modelCustomer.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);
                }
                return View("CustomerAddEdit", modelCustomer);

            }
            return View("CustomerAddEdit");
        }
        #endregion

        #region INSERT AND EDIT
        [HttpPost]

        public IActionResult Save(CustomerModel modelCustomer)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            if (modelCustomer.CustomerID == 0)
            {
                cmd.CommandText = "PR_Customer_Insert";
                cmd.Parameters.Add("@CreationDate", SqlDbType.Date).Value = DBNull.Value;

            }
            else
            {

                cmd.CommandText = "PR_Customer_UpdateByPK";
                cmd.Parameters.Add("@CustomerID", SqlDbType.Int).Value = modelCustomer.CustomerID;
            }
            cmd.Parameters.Add("@CustomerName", SqlDbType.VarChar).Value = modelCustomer.CustomerName;
            cmd.Parameters.Add("@CustomerPassword", SqlDbType.VarChar).Value = modelCustomer.CustomerPassword;
            cmd.Parameters.Add("@ModificationDate", SqlDbType.Date).Value = DBNull.Value;

            cmd.ExecuteNonQuery();
            Connect.Close();
            return RedirectToAction("Index");
        }
        #endregion

    }

}

