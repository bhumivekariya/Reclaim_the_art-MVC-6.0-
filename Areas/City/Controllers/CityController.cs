using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Reclaim_the_art.Areas.City.Models;
using Reclaim_the_art.Areas.Country.Models;
using Reclaim_the_art.Areas.State.Models;
using System.Data;

namespace Reclaim_the_art.Areas.City.Controllers
{
    [Area("City")]
    [Route("City/[controller]/[action]")]
    public class CityController : Controller
    {
        #region CONFIG
        private IConfiguration Configuration;
        public CityController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }
        #endregion

        #region CANCLE
        public IActionResult Cancel()
        {
            return RedirectToAction("Index");
        }
        #endregion

        #region SELECT ALL
        public IActionResult Index()
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_City_SelectAll";
            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            return View("CityList", dt);
        }
        #endregion

        #region DELETE
        public IActionResult Delete(int CityID)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_City_DeleteByPK";
            cmd.Parameters.AddWithValue("@CityID", CityID);
            cmd.ExecuteNonQuery();
            Connect.Close();
            return RedirectToAction("Index");

        }
        #endregion

        #region ADD
        public IActionResult Add(int? CityID)
        {
            #region DropDownForCountry
            string connstr = this.Configuration.GetConnectionString("myConnectionString");

            //Prepare Connection
            SqlConnection sqlconn = new SqlConnection(connstr);
            sqlconn.Open();

            //Prepare Command
            SqlCommand sqlCommand = sqlconn.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "PR_Country_SelectForDropDown";
            DataTable dataTable = new DataTable();
            SqlDataReader rdr = sqlCommand.ExecuteReader();
            dataTable.Load(rdr);

            List<CountryDropDownModel> list = new List<CountryDropDownModel>();
            foreach (DataRow datarow in dataTable.Rows)
            {
                CountryDropDownModel vlst = new CountryDropDownModel();
                vlst.CountryID = Convert.ToInt32(datarow["CountryID"]);
                vlst.CountryName = (string)datarow["CountryName"];
                list.Add(vlst);
            }
            ViewBag.CountryList = list;
            #endregion 

            #region DropDownForState

            List<StateDropDownModel> list1 = new List<StateDropDownModel>();
            ViewBag.StateList = list1;
            #endregion

            if (CityID != null)
            {

                string str = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection Connect = new SqlConnection(str);
                Connect.Open();
                SqlCommand cmd = Connect.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_City_SelectByPK";
                cmd.Parameters.Add("@CityID", SqlDbType.Int).Value = CityID;
                DataTable dt = new DataTable();
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
                CityModel modelCity = new CityModel();

                foreach (DataRow dr in dt.Rows)
                {
                   modelCity.CityID = Convert.ToInt32(dr["CityID"]);
                   modelCity.CountryID = Convert.ToInt32(dr["CountryID"]);
                   modelCity.StateID = Convert.ToInt32(dr["StateID"]);
                   modelCity.CityName = dr["CityName"].ToString();
                   modelCity.Pincode = dr["Pincode"].ToString();
                   modelCity.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                   modelCity.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);
                }

                // DropDown State Overwrite

                string strr = Configuration.GetConnectionString("myConnectionString");
                SqlConnection connds = new SqlConnection(strr);
                connds.Open();

                SqlCommand cmdds = connds.CreateCommand();
                cmdds.CommandType = CommandType.StoredProcedure;
                cmdds.CommandText = "PR_State_SelectForDropDownByCountryID";
                cmdds.Parameters.AddWithValue("@CountryID", modelCity.CountryID);
                DataTable dtds = new DataTable();
                SqlDataReader objsdrr = cmdds.ExecuteReader();

                dtds.Load(objsdrr);
                // connds.Close();

                List<StateDropDownModel> listt = new List<StateDropDownModel>();
                foreach (DataRow dr in dtds.Rows)
                {
                    StateDropDownModel ttlist = new StateDropDownModel();
                    ttlist.StateID = Convert.ToInt32(dr["StateID"]);
                    ttlist.StateName = dr["StateName"].ToString();
                    listt.Add(ttlist);
                }

                ViewBag.StateList = listt;


                return View("CityAddEdit", modelCity);

            }
            return View("CityAddEdit");

        }
        public ActionResult DropDownByCountry(int CountryID)
        {
            string connectionstr = Configuration.GetConnectionString("myConnectionString");


            SqlConnection conn1 = new SqlConnection(connectionstr);
            conn1.Open();
            SqlCommand cmd1 = conn1.CreateCommand();
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.CommandText = "PR_State_SelectForDropDownByCountryID";
            cmd1.Parameters.AddWithValue("@CountryID", CountryID);
            DataTable dt1 = new DataTable();
            SqlDataReader objSDR1 = cmd1.ExecuteReader();
            dt1.Load(objSDR1);

            List<StateDropDownModel> list1 = new List<StateDropDownModel>();
            foreach (DataRow dr in dt1.Rows)
            {
                StateDropDownModel vl = new StateDropDownModel();
                vl.StateID = Convert.ToInt32(dr["StateID"]);
                vl.StateName = Convert.ToString(dr["StateName"]);
                list1.Add(vl);
            }


            var vmodel = list1;
            return Json(vmodel);
        }

        #endregion

        #region INSERT
        [HttpPost]

        public IActionResult Save(CityModel modelCity)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            if (modelCity.CityID == null)
            {
                cmd.CommandText = "PR_City_Insert";
                cmd.Parameters.Add("@CreationDate", SqlDbType.Date).Value = DBNull.Value;
            }
            else
            {
                cmd.CommandText = "PR_City_UpdateByPK";
                cmd.Parameters.Add("@CityID", SqlDbType.Int).Value = modelCity.CityID;

            }

            cmd.Parameters.Add("@CityName", SqlDbType.VarChar).Value = modelCity.CityName;
            cmd.Parameters.Add("@Pincode", SqlDbType.VarChar).Value = modelCity.Pincode;
            cmd.Parameters.Add("@CountryID", SqlDbType.VarChar).Value = modelCity.CountryID;
            cmd.Parameters.Add("@StateID", SqlDbType.VarChar).Value = modelCity.StateID;
            cmd.Parameters.Add("@ModificationDate", SqlDbType.Date).Value = DBNull.Value;
            cmd.ExecuteNonQuery();
            Connect.Close();
            return RedirectToAction("Index");
        }
        #endregion
    }
}
