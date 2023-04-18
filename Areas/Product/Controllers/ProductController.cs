using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Reclaim_the_art.Areas.Product.Models;
using System.Data;

namespace Reclaim_the_art.Areas.Product.Controllers
{
    [Area("Product")]
    [Route("Product/[controller]/[action]")]
    public class ProductController : Controller
    {
        #region Connection String
        private IConfiguration Configuration;
        public ProductController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }
        #endregion

        #region SELECTAALL
        public IActionResult Index()
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_Product_SelectAll";
            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            return View("ProductList", dt);
        }
        #endregion

        #region DELETE
        public IActionResult Delete(int ProductID)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_Product_DeleteByPK";
            cmd.Parameters.AddWithValue("@ProductID", ProductID);
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
        public IActionResult Add(int? ProductID)
        {

            if (ProductID != null)
            {

                string str = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection Connect = new SqlConnection(str);
                Connect.Open();
                SqlCommand cmd = Connect.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_Product_SelectByPK";
                cmd.Parameters.Add("@ProductID", SqlDbType.Int).Value = ProductID;
                DataTable dt = new DataTable();
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
                ProductModel modelProduct = new ProductModel();

                foreach (DataRow dr in dt.Rows)
                {
                    modelProduct.ProductID = Convert.ToInt32(dr["ProductID"]);
                    modelProduct.ProductName = dr["ProductName"].ToString();
                    modelProduct.ProductPicture = dr["ProductPicture"].ToString();
                    modelProduct.ProductDiscription = dr["ProductDiscription"].ToString();
                    modelProduct.ProductPrice = Convert.ToInt32(dr["ProductPrice"]);
                    modelProduct.ProductDiscount = dr["ProductDiscount"].ToString();
                    modelProduct.ProductTypeID = Convert.ToInt32(dr["ProductTypeID"]);
                    modelProduct.CustomerID = Convert.ToInt32(dr["CustomerID"]);
                    modelProduct.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                    modelProduct.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);
                }
                return View("ProductAddEdit", modelProduct);

            }
            return View("ProductAddEdit");
        }
        #endregion

        #region INSERT AND EDIT
        [HttpPost]

        public IActionResult Save(ProductModel modelProduct)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            if (modelProduct.ProductID == 0)
            {
                cmd.CommandText = "PR_Product_Insert";
                cmd.Parameters.Add("@CreationDate", SqlDbType.Date).Value = DBNull.Value;

            }
            else
            {

                cmd.CommandText = "PR_Product_UpdateByPK";
                cmd.Parameters.Add("@ProductID", SqlDbType.Int).Value = modelProduct.ProductID;
            }

            cmd.Parameters.Add("@ProductName", SqlDbType.VarChar).Value = modelProduct.ProductName;
           
            cmd.Parameters.Add("@ProductDiscription", SqlDbType.VarChar).Value = modelProduct.ProductDiscription;
            cmd.Parameters.Add("@ProductPrice", SqlDbType.Int).Value = modelProduct.ProductPrice;
            cmd.Parameters.Add("@ProductDiscount", SqlDbType.VarChar).Value = modelProduct.ProductDiscount;
            cmd.Parameters.Add("@ProductTypeID", SqlDbType.Int).Value = modelProduct.ProductTypeID;
            cmd.Parameters.Add("@CustomerID", SqlDbType.Int).Value = modelProduct.CustomerID;
            cmd.Parameters.Add("@ModificationDate", SqlDbType.Date).Value = DBNull.Value;



            #region FILE_UPLOAD

            if (modelProduct.File != null)
            {
                string file_loc = "wwwroot\\upload";
                string full_path = Path.Combine(Directory.GetCurrentDirectory(), file_loc);

                if (!Directory.Exists(full_path))
                {
                    Directory.CreateDirectory(full_path);
                }

                string file_name_with_path = Path.Combine(full_path, modelProduct.File.FileName);
                modelProduct.ProductPicture = file_loc.Replace("wwwroot\\", "/")+ "/" + modelProduct.File.FileName;
               

                cmd.Parameters.Add("@ProductPicture", SqlDbType.VarChar).Value = modelProduct.ProductPicture;

                using (var stream = new FileStream(file_name_with_path, FileMode.Create))
                {
                    modelProduct.File.CopyTo(stream);
                }
            }
            #endregion
            cmd.ExecuteNonQuery();
            Connect.Close();
            return RedirectToAction("Index");
        }
        #endregion



    }
}
