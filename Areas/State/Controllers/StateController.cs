using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Reclaim_the_art.Areas.Country.Models;
using Reclaim_the_art.Areas.State.Models;
using System.Data;

namespace Reclaim_the_art.Areas.State.Controllers
{
    [Area("State")]
    [Route("State/[controller]/[action]")]
    public class StateController : Controller
    {
        #region Connection String
        private IConfiguration Configuration;
        public StateController(IConfiguration _configuration)
        {
            Configuration = _configuration;
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
            cmd.CommandText = "PR_State_SelectAll";
            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            return View("StateList", dt);
        }
        #endregion

        #region DELETE
        public IActionResult Delete(int StateID)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_State_DeleteByPK";
            cmd.Parameters.AddWithValue("@StateID", StateID);
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
        public IActionResult Add(int? StateID)
        {
            #region DropDownForCountry
            string Con_str = this.Configuration.GetConnectionString("myConnectionString");

            //Prepare Connection
            SqlConnection Con = new SqlConnection(Con_str);
            Con.Open();

            //Prepare Command
            SqlCommand Command = Con.CreateCommand();
            Command.CommandType = CommandType.StoredProcedure;
            Command.CommandText = "PR_Country_SelectForDropDown";
            DataTable dataTable = new DataTable();
            SqlDataReader rdr = Command.ExecuteReader();
            dataTable.Load(rdr);

            List<CountryDropDownModel> list = new List<CountryDropDownModel>();
            foreach (DataRow datarow in dataTable.Rows)
            {
                CountryDropDownModel countrylist = new CountryDropDownModel();
                countrylist.CountryID = Convert.ToInt32(datarow["CountryID"]);
                countrylist.CountryName = (string)datarow["CountryName"];
                list.Add(countrylist);
            }
            ViewBag.CountryList = list;
            #endregion

            if (StateID != null)
            {

                string str = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection Connect = new SqlConnection(str);
                Connect.Open();
                SqlCommand cmd = Connect.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_State_SelectByPK";
                cmd.Parameters.Add("@StateID", SqlDbType.Int).Value = StateID;
                DataTable dt = new DataTable();
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
               StateModel modelState = new StateModel();

                foreach (DataRow dr in dt.Rows)
                {
                    modelState.CountryID = Convert.ToInt32(dr["CountryID"]);
                    modelState.StateID = Convert.ToInt32(dr["StateID"]);
                    modelState.StateName = dr["StateName"].ToString();
                    modelState.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                    modelState.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);
                }
                return View("StateAddEdit", modelState);

            }
            return View("StateAddEdit");
        }
        #endregion

        #region SAVE
        public IActionResult Save(StateModel modelState)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            if (modelState.StateID == null)
            {
                cmd.CommandText = "PR_State_Insert";
                cmd.Parameters.Add("@CreationDate", SqlDbType.Date).Value = DBNull.Value;
            }
            else
            {
                cmd.CommandText = "PR_State_UpdateByPK";
                cmd.Parameters.Add("@StateID", SqlDbType.Int).Value = modelState.StateID;

            }

            cmd.Parameters.Add("@StateName", SqlDbType.VarChar).Value = modelState.StateName;
            cmd.Parameters.Add("@CountryID", SqlDbType.VarChar).Value = modelState.CountryID;
            cmd.Parameters.Add("@ModificationDate", SqlDbType.Date).Value = DBNull.Value;
            cmd.ExecuteNonQuery();
            Connect.Close();
            return RedirectToAction("Index");
        }
        #endregion
    }
}
