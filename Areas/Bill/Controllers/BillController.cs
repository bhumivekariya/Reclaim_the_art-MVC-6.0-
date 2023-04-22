using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Reclaim_the_art.Areas.Bill.Models;
using Reclaim_the_art.Areas.City.Models;
using Reclaim_the_art.Areas.Country.Models;
using Reclaim_the_art.Areas.Customer.Models;
using Reclaim_the_art.Areas.State.Models;
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
            #region Customer
            string Con_str = this.Configuration.GetConnectionString("myConnectionString");

            //Prepare Connection
            SqlConnection Con = new SqlConnection(Con_str);
            Con.Open();

            //Prepare Command
            SqlCommand Command = Con.CreateCommand();
            Command.CommandType = CommandType.StoredProcedure;
            Command.CommandText = "PR_CustomerName_SelectForDropDown";
            DataTable dataTable = new DataTable();
            SqlDataReader rdr = Command.ExecuteReader();
            dataTable.Load(rdr);

            List<CustomerNameDropDownModel> list = new List<CustomerNameDropDownModel>();
            foreach (DataRow datarow in dataTable.Rows)
            {
                CustomerNameDropDownModel customerlist = new CustomerNameDropDownModel();
                customerlist.CustomerID = Convert.ToInt32(datarow["CustomerID"]);
                customerlist.CustomerName = (string)datarow["CustomerName"];
                list.Add(customerlist);
            }
            ViewBag.CustomerList = list;

            #endregion

            #region DropDownForCountry
            string connstr = this.Configuration.GetConnectionString("myConnectionString");

            //Prepare Connection
            SqlConnection sqlconn = new SqlConnection(connstr);
            sqlconn.Open();

            //Prepare Command
            SqlCommand sqlCommand = sqlconn.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "PR_Country_SelectForDropDown";
            DataTable dt = new DataTable();
            SqlDataReader rdr1 = sqlCommand.ExecuteReader();
            dt.Load(rdr1);

            List<CountryDropDownModel> lst = new List<CountryDropDownModel>();
            foreach (DataRow datarow in dt.Rows)
            {
                CountryDropDownModel vlst1 = new CountryDropDownModel();
                vlst1.CountryID = Convert.ToInt32(datarow["CountryID"]);
                vlst1.CountryName = (string)datarow["CountryName"];
                lst.Add(vlst1);
            }
            ViewBag.CountryList = lst;
            #endregion

           
            List<StateDropDownModel> list1 = new List<StateDropDownModel>();
            ViewBag.StateList = list1;


            List<CityDropDownModel> list2 = new List<CityDropDownModel>();
            ViewBag.CityList = list2;

            if (BillID != null)
            {

                string str = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection Connect = new SqlConnection(str);
                Connect.Open();
                SqlCommand cmd = Connect.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_Bill_SelectByPK";
                cmd.Parameters.Add("@BillID", SqlDbType.Int).Value = BillID;
                DataTable dt1 = new DataTable();
                SqlDataReader sdr = cmd.ExecuteReader();
                dt1.Load(sdr);
                BillModel modelBill = new BillModel();

                foreach (DataRow dr in dt1.Rows)
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

        #region DropDownByCountryID
        public IActionResult DropDownByCountry(int CountryID)
        {
            string connectionstr = this.Configuration.GetConnectionString("myConnectionString");

            //Prepare a connection
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(connectionstr);
            conn.Open();

            //Prepare a command

            SqlCommand objcmd = conn.CreateCommand();
            objcmd.CommandType = CommandType.StoredProcedure;
            objcmd.CommandText = "PR_State_SelectForDropDownByCountryID";
            objcmd.Parameters.AddWithValue("@CountryID", CountryID);
            SqlDataReader objSDR = objcmd.ExecuteReader();
            dt.Load(objSDR);
            conn.Close();

            List<StateDropDownModel> list = new List<StateDropDownModel>();
            foreach (DataRow dr in dt.Rows)
            {
                StateDropDownModel vlst = new StateDropDownModel();
                vlst.StateID = Convert.ToInt32(dr["StateID"]);
                vlst.StateName = dr["StateName"].ToString();
                list.Add(vlst);
            }

            var vModel = list;
            return Json(vModel);

        }

        #endregion

        #region DropDownByStateID
        public IActionResult DropDownByState(int StateID)
        {

            string connectionstr = this.Configuration.GetConnectionString("myConnectionString");

            //Prepare a connection
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(connectionstr);
            conn.Open();

            //Prepare a command

            SqlCommand objcmd = conn.CreateCommand();
            objcmd.CommandType = CommandType.StoredProcedure;
            objcmd.CommandText = "PR_City_SelectForDropDownByStateID";
            objcmd.Parameters.AddWithValue("@StateID", StateID);
            SqlDataReader objSDR = objcmd.ExecuteReader();
            dt.Load(objSDR);
            conn.Close();

            List<CityDropDownModel> list = new List<CityDropDownModel>();
            foreach (DataRow dr in dt.Rows)
            {
                CityDropDownModel vlst = new CityDropDownModel();
                vlst.CityID = Convert.ToInt32(dr["CityID"]);
                vlst.CityName = dr["CityName"].ToString();
                list.Add(vlst);
            }

            var vModel = list;
            return Json(vModel);
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
