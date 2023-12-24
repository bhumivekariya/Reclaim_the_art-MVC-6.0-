using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Reclaim_the_art.Areas.Country.Models;
using System.Data;

namespace Reclaim_the_art.Areas.Country.Controllers
{
    [Area("Country")]
    [Route("Country/[controller]/[action]")]
    public class CountryController : Controller
    {
        #region CONFIGSTRING
        private IConfiguration Configuration;
        public CountryController(IConfiguration _configuration)
        {
            Configuration = _configuration;

        }
        #endregion

        #region DELETE
        public IActionResult Delete(int CountryID)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_Country_DeleteByPK";
            cmd.Parameters.AddWithValue("@CountryID", CountryID);
            cmd.ExecuteNonQuery();
            Connect.Close();
            return RedirectToAction("Index");

        }
        #endregion

        #region SELECTALL
        public IActionResult Index()
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_Country_SelectAll";
            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            return View("CountryList", dt);
        }
        #endregion

        #region CANCLE
        public IActionResult Cancel()
        {
            return RedirectToAction("Index");
        }
        #endregion

        #region ADD
        public IActionResult Add(int? CountryID)
        {

            if (CountryID != null)
            {

                string str = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection Connect = new SqlConnection(str);
                Connect.Open();
                SqlCommand cmd = Connect.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_Country_SelectByPK";
                cmd.Parameters.Add("@CountryID", SqlDbType.Int).Value = CountryID;
                DataTable dt = new DataTable();
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
                CountryModel modelCountry = new CountryModel();

                foreach (DataRow dr in dt.Rows)
                {
                   modelCountry.CountryID = Convert.ToInt32(dr["CountryID"]);
                   modelCountry.CountryName = dr["CountryName"].ToString();
                   modelCountry.CountryCode = dr["CountryCode"].ToString();
                   modelCountry.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                    modelCountry.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);
                }
                return View("CountryAddEdit", modelCountry);

            }
            return View("CountryAddEdit");
        }
        #endregion

        #region INSERT AND EDIT
        [HttpPost]

        public IActionResult Save(CountryModel modelCountry)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            if (modelCountry.CountryID == null)
            {
                cmd.CommandText = "PR_Country_Insert";
                cmd.Parameters.Add("@CreationDate", SqlDbType.Date).Value = DBNull.Value;
            }
            else
            {
                cmd.CommandText = "PR_Country_UpdateByPK";
                cmd.Parameters.Add("@CountryID", SqlDbType.Int).Value = modelCountry.CountryID;

            }

            cmd.Parameters.Add("@CountryName", SqlDbType.VarChar).Value = modelCountry.CountryName;
            cmd.Parameters.Add("@CountryCode", SqlDbType.VarChar).Value = modelCountry.CountryCode;
            cmd.Parameters.Add("@ModificationDate", SqlDbType.Date).Value = DBNull.Value;
            cmd.ExecuteNonQuery();
            Connect.Close();
            return RedirectToAction("Index");
        }
        #endregion
    }
}
