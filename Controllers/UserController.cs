using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;

namespace Reclaim_the_art.Controllers
{
    public class UserController : Controller
    {
        #region Connection String
        private IConfiguration Configuration;
        public UserController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }
        #endregion

        public IActionResult Index()
        {
            return View("Home");
        }
        public IActionResult Shop()
        {
            return View();
        }
        public IActionResult Service()
        {
            return View();
        }
        public IActionResult HomeDecore()
		{
			string str = this.Configuration.GetConnectionString("myConnectionString");
			DataTable dt = new DataTable();
			using (SqlConnection Connect = new SqlConnection(str))
			{
				Connect.Open();
				SqlCommand cmd = Connect.CreateCommand();
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.CommandText = "PR_Product_SelectAll";
				SqlDataReader sdr = cmd.ExecuteReader();
				dt.Load(sdr);
			}

			return View("HomeDecore", dt);
		}
		public IActionResult ToysAndTools()
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            using (SqlConnection Connect = new SqlConnection(str))
            {
                Connect.Open();
                SqlCommand cmd = Connect.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_Product_SelectAll";
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return View("ToysAndTools" , dt);
        }
        public IActionResult Lifestyle()
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            using (SqlConnection Connect = new SqlConnection(str))
            {
                Connect.Open();
                SqlCommand cmd = Connect.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_Product_SelectAll";
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return View("Lifestyle" , dt);
        }
        public IActionResult Stationary()
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            using (SqlConnection Connect = new SqlConnection(str))
            {
                Connect.Open();
                SqlCommand cmd = Connect.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_Product_SelectAll";
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return View("Stationary", dt);
        }
        public IActionResult EventDecor()
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            using (SqlConnection Connect = new SqlConnection(str))
            {
                Connect.Open();
                SqlCommand cmd = Connect.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_Product_SelectAll";
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return View("EventDecor" , dt);
        }
    }
}
