using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Reclaim_the_art.Areas.Admin.Models;
using Reclaim_the_art.Areas.ProductType.Models;
using System.Data;

namespace Reclaim_the_art.Areas.ProductType.Controllers
{
    [Area("ProductType")]
    [Route("ProductType/[controller]/[action]")]
    public class ProductTypeController : Controller
    {
        #region Connection String
        private IConfiguration Configuration;
        public ProductTypeController(IConfiguration _configuration)
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
            cmd.CommandText = "PR_ProductType_SelectAll";
            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            return View("ProductTypeList", dt);
        }
        #endregion

        #region DELETE
        public IActionResult Delete(int ProductTypeID)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_ProductType_DeleteByPK";
            cmd.Parameters.AddWithValue("@ProductTypeID", ProductTypeID);
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
        public IActionResult Add(int? ProductTypeID)
        {

            if (ProductTypeID != null)
            {

                string str = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection Connect = new SqlConnection(str);
                Connect.Open();
                SqlCommand cmd = Connect.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_ProductType_SelectByPK";
                cmd.Parameters.Add("@ProductTypeID", SqlDbType.Int).Value = ProductTypeID;
                DataTable dt = new DataTable();
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
                ProductTypeModel modelProductType = new ProductTypeModel();

                foreach (DataRow dr in dt.Rows)
                {
                    modelProductType.ProductTypeID = Convert.ToInt32(dr["ProductTypeID"]);
                    modelProductType.ProductType = dr["ProductType"].ToString();
                    modelProductType.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                    modelProductType.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);
                }
                return View("ProductTypeAddEdit", modelProductType);

            }
            return View("ProductTypeAddEdit");
        }
        #endregion

        #region INSERT AND EDIT
        [HttpPost]

        public IActionResult Save(ProductTypeModel modelProductType)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            if (modelProductType.ProductTypeID == 0)
            {
                cmd.CommandText = "PR_ProductType_Insert";
                cmd.Parameters.Add("@CreationDate", SqlDbType.Date).Value = DBNull.Value;

            }
            else
            {

                cmd.CommandText = "PR_ProductType_UpdateByPK";
                cmd.Parameters.Add("@ProductTypeID", SqlDbType.Int).Value = modelProductType.ProductTypeID;
            }

            cmd.Parameters.Add("@ProductType", SqlDbType.VarChar).Value = modelProductType.ProductType;
            cmd.Parameters.Add("@ModificationDate", SqlDbType.Date).Value = DBNull.Value;

            cmd.ExecuteNonQuery();
            Connect.Close();
            return RedirectToAction("Index");
        }
        #endregion
    }
}
