using Microsoft.AspNetCore.Mvc;
using Reclaim_the_art.Areas.AdminLogin.Models;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;


namespace Reclaim_the_art.Areas.AdminLogin.Controllers
{
    [Area("AdminLogin")]
    [Route("AdminLogin/[controller]/[action]")]
    public class AdminLoginController : Controller
    {
        private IConfiguration Configuration;
        public AdminLoginController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }
        public IActionResult AdminLogin()
        {
            return View("AdminLogin");
        }

        #region "Login"
        [HttpPost]
        public IActionResult Login(AdminLoginModel modelAdminLogin)
        {
            string connstr = Configuration.GetConnectionString("myConnectionString");
            string? error = null;
            if (modelAdminLogin.AdminUserName == null)
            {
                error += "Username is required";
            }
            if (modelAdminLogin.AdminPassWord == null)
            {
                error += "<br/>Password is required";
            }

            if (error != null)
            {
                TempData["Error"] = error;
                return RedirectToAction("AdminLogin");
            }
            else
            {

                try
                {
                    SqlDatabase sqlDB = new SqlDatabase(connstr);
                    DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_AdminLogin_SelectByUsernamePassword");
                    sqlDB.AddInParameter(dbCMD, "Username", SqlDbType.NVarChar, modelAdminLogin.AdminUserName);
                    sqlDB.AddInParameter(dbCMD, "Password", SqlDbType.NVarChar, modelAdminLogin.AdminPassWord);

                    DataTable dt = new DataTable();
                    using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                    {
                        dt.Load(dr);
                    }

                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {

                            HttpContext.Session.SetString("AdminID", dr["AdminID"].ToString());
                            HttpContext.Session.SetString("AdminName", dr["AdminName"].ToString());
                            HttpContext.Session.SetString("AdminUserName", dr["AdminUserName"].ToString());
                            HttpContext.Session.SetString("AdminPassWord", dr["AdminPassWord"].ToString());
                            HttpContext.Session.SetString("CreationDate", dr["CreationDate"].ToString());
                            HttpContext.Session.SetString("ModificationDate", dr["ModificationDate"].ToString());
                            break;
                        }
                    }
                    else
                    {
                        TempData["Error"] = "Username or Password is invalid!";
                        return RedirectToAction("AdminLogin");
                    }
                    if (HttpContext.Session.GetString("AdminUserName") != null && HttpContext.Session.GetString("AdminPassWord") != null)
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }

                catch (Exception ex)
                {
                    Console.WriteLine("An error occurred in PR_AdminLogin_SelectByUsernamePassword:");
                    Console.WriteLine(ex.Message);
                    Console.WriteLine(ex.StackTrace);
                    return null;
                }
            }

            return RedirectToAction("AdminLogin");

        }
        #endregion

        #region "Logout"
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "User");
        }

        #endregion

    }
}
