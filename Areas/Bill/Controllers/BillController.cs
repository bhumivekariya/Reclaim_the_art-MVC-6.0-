using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Reclaim_the_art.Areas.Admin.Models;
using Reclaim_the_art.Areas.Bill.Models;
using System.Data;

namespace Reclaim_the_art.Areas.Bill.Controllers
{
    [Area("Bill")]
    [Route("Bill/[controller]/[action]")]
    public class BillController : Controller
    {
        #region Connection String
        private IConfiguration Configuration;
        public BillController(IConfiguration _configuration)
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
            cmd.CommandText = "PR_Bill_SelectAll";
            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            return View("BillList", dt);
        }
        #endregion

        #region DELETE
        public IActionResult Delete(int BillID)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_Bill_DeleteByPK";
            cmd.Parameters.AddWithValue("@BillID", BillID);
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
        public IActionResult Add(int? BillID)
        {
            if (BillID != null)
            {

                string str = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection Connect = new SqlConnection(str);
                Connect.Open();
                SqlCommand cmd = Connect.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_Bill_SelectByPK";
                cmd.Parameters.Add("@BillID", SqlDbType.Int).Value = BillID;
                DataTable dt = new DataTable();
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
                BillModel modelBill = new BillModel();

                foreach (DataRow dr in dt.Rows)
                {
                   modelBill.BillID = Convert.ToInt32(dr["BillID"]);
                   modelBill.BillAmount = Convert.ToInt32(dr["BillAmount"]);
                   modelBill.BillStatus = dr["BillStatus"].ToString();
                   modelBill.CustomerID = Convert.ToInt32(dr["CustomerID"]);
                   modelBill.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                   modelBill.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);
                   modelBill.CountryID = Convert.ToInt32(dr["CountryID"]);
                   modelBill.StateID = Convert.ToInt32(dr["StateID"]);
                   modelBill.CityID = Convert.ToInt32(dr["CityID"]);

                }
                return View("BillAddEdit", modelBill);

            }
            return View("BillAddEdit");
        }
        #endregion

        #region INSERT AND EDIT
        [HttpPost]

        public IActionResult Save(BillModel modelBill)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            if (modelBill.BillID == 0)
            {
                cmd.CommandText = "PR_Bill_Insert";
                cmd.Parameters.Add("@CreationDate", SqlDbType.Date).Value = DBNull.Value;

            }
            else
            {

                cmd.CommandText = "PR_Bill_UpdateByPK";
                cmd.Parameters.Add("@BillID", SqlDbType.Int).Value = modelBill.BillID;
            }

            cmd.Parameters.Add("@BillAmount", SqlDbType.Int).Value = modelBill.BillAmount;
            cmd.Parameters.Add("@BillStatus", SqlDbType.VarChar).Value = modelBill.BillStatus;
            cmd.Parameters.Add("@CustomerID", SqlDbType.Int).Value = modelBill.CustomerID;
            cmd.Parameters.Add("@ModificationDate", SqlDbType.Date).Value = DBNull.Value;
            cmd.Parameters.Add("@CountryID", SqlDbType.Int).Value = modelBill.CountryID;
            cmd.Parameters.Add("@StateID", SqlDbType.Int).Value = modelBill.StateID;
            cmd.Parameters.Add("@CityID", SqlDbType.Int).Value = modelBill.CityID;

            cmd.ExecuteNonQuery();
            Connect.Close();
            return RedirectToAction("Index");
        }
        #endregion
    }
}
