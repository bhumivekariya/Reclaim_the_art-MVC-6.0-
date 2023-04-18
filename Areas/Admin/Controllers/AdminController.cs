using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Reclaim_the_art.Areas.Admin.Models;
using System.Data;



namespace Reclaim_the_art.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Route("Admin/[controller]/[action]")]
    public class AdminController : Controller
    {
        #region Connection String
        private IConfiguration Configuration;
        public AdminController(IConfiguration _configuration)
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
            cmd.CommandText = "PR_Admin_SelectAll";
            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            return View("AdminList", dt);
        }
        #endregion

        #region DELETE
        public IActionResult Delete(int AdminID)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_Admin_DeleteByPK";
            cmd.Parameters.AddWithValue("@AdminID", AdminID);
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
        public IActionResult Add(int? AdminID)
        {

            if (AdminID != null)
            {

                string str = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection Connect = new SqlConnection(str);
                Connect.Open();
                SqlCommand cmd = Connect.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_Admin_SelectByPK";
                cmd.Parameters.Add("@AdminID", SqlDbType.Int).Value = AdminID;
                DataTable dt = new DataTable();
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
                AdminModel modelAdmin = new AdminModel();

                foreach (DataRow dr in dt.Rows)
                {
                    modelAdmin.AdminID = Convert.ToInt32(dr["AdminID"]);
                    modelAdmin.AdminName = dr["AdminName"].ToString();
                    modelAdmin.AdminUserName = dr["AdminUserName"].ToString();
                    modelAdmin.AdminPassWord = dr["AdminPassWord"].ToString();
                    modelAdmin.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                    modelAdmin.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);
                }
                return View("AdminAddEdit", modelAdmin);

            }
            return View("AdminAddEdit");
        }
        #endregion

        #region INSERT AND EDIT
        [HttpPost]

        public IActionResult Save(AdminModel modelAdmin)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            if (modelAdmin.AdminID == 0)
            {
                cmd.CommandText = "PR_Admin_Insert";
                cmd.Parameters.Add("@CreationDate", SqlDbType.Date).Value = DBNull.Value;

            }
            else
            {
               
                cmd.CommandText = "PR_Admin_UpdateByPK";
                cmd.Parameters.Add("@AdminID", SqlDbType.Int).Value = modelAdmin.AdminID;
            }

            cmd.Parameters.Add("@AdminName", SqlDbType.VarChar).Value = modelAdmin.AdminName;
            cmd.Parameters.Add("@AdminUserName", SqlDbType.VarChar).Value = modelAdmin.AdminUserName;
            cmd.Parameters.Add("@AdminPassWord", SqlDbType.VarChar).Value = modelAdmin.AdminPassWord;
            cmd.Parameters.Add("@ModificationDate", SqlDbType.Date).Value = DBNull.Value;

            cmd.ExecuteNonQuery();
            Connect.Close();
            return RedirectToAction("Index");
        }
        #endregion

      
    }
}
