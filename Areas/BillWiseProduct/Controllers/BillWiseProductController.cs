using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Reclaim_the_art.Areas.Admin.Models;
using Reclaim_the_art.Areas.BillWiseProduct.Models;
using Reclaim_the_art.Areas.Customer.Models;
using Reclaim_the_art.Areas.Product.Models;
using System.Data;

namespace Reclaim_the_art.Areas.BillWiseProduct.Controllers
{
    [Area("BillWiseProduct")]
    [Route("BillWiseProduct/[controller]/[action]")]
    public class BillWiseProductController : Controller
    {
        #region Connection String
        private IConfiguration Configuration;
        public BillWiseProductController(IConfiguration _configuration)
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
            cmd.CommandText = "PR_BillWiseProduct_SelectAll";
            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            return View("BillWiseProductList", dt);
        }
        #endregion

        #region CANCLE
        public IActionResult Cancle()
        {
            return RedirectToAction("Index");
        }
        #endregion

        #region ADD
        public IActionResult Add(int? BillWiseProductID)
        {

            #region Product
            string Con_str = this.Configuration.GetConnectionString("myConnectionString");

            //Prepare Connection
            SqlConnection Con = new SqlConnection(Con_str);
            Con.Open();

            //Prepare Command
            SqlCommand Command = Con.CreateCommand();
            Command.CommandType = CommandType.StoredProcedure;
            Command.CommandText = "PR_ProductName_SelectForDropDown";
            DataTable dataTable = new DataTable();
            SqlDataReader rdr = Command.ExecuteReader();
            dataTable.Load(rdr);

            List<ProductNameDropDownModel> list = new List<ProductNameDropDownModel>();
            foreach (DataRow datarow in dataTable.Rows)
            {
                ProductNameDropDownModel productlist = new ProductNameDropDownModel();
                productlist.ProductID = Convert.ToInt32(datarow["ProductID"]);
                productlist.ProductName = (string)datarow["ProductName"];
                list.Add(productlist);
            }
            ViewBag.productlist = list;

            #endregion

            if (BillWiseProductID != null)
            {

                string str = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection Connect = new SqlConnection(str);
                Connect.Open();
                SqlCommand cmd = Connect.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_BillWiseProduct_SelectByPK";
                cmd.Parameters.Add("@BillWiseProductID", SqlDbType.Int).Value = BillWiseProductID;
                DataTable dt = new DataTable();
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
                BillWiseProductModel modelBillWiseProduct = new BillWiseProductModel();

                foreach (DataRow dr in dt.Rows)
                {
                    modelBillWiseProduct.BillWiseProductID = Convert.ToInt32(dr["BillWiseProductID"]);
                    modelBillWiseProduct.Quantity = dr["Quantity"].ToString();
                    modelBillWiseProduct.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                    modelBillWiseProduct.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);
                    modelBillWiseProduct.BillID = Convert.ToInt32(dr["BillID"]);
                    modelBillWiseProduct.ProductID = Convert.ToInt32(dr["ProductID"]);
                }
                return View("BillWiseProductAddEdit", modelBillWiseProduct);

            }
            return View("BillWiseProductAddEdit");
        }
        #endregion

        #region INSERT 
        [HttpPost]

        public IActionResult Save(BillWiseProductModel modelBillWiseProduct)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection Connect = new SqlConnection(str);
            Connect.Open();
            SqlCommand cmd = Connect.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            if (modelBillWiseProduct.BillWiseProductID == 0)
            {
                cmd.CommandText = "PR_BillWiseProduct_Insert";
                cmd.Parameters.Add("@CreationDate", SqlDbType.Date).Value = DBNull.Value;
                cmd.Parameters.Add("@Quantity", SqlDbType.VarChar).Value = modelBillWiseProduct.Quantity;
                cmd.Parameters.Add("@ModificationDate", SqlDbType.Date).Value = DBNull.Value;
                cmd.Parameters.Add("@BillID", SqlDbType.Int).Value = modelBillWiseProduct.BillID;
                cmd.Parameters.Add("@ProductID", SqlDbType.Int).Value = modelBillWiseProduct.ProductID;
            }
            cmd.ExecuteNonQuery();
            Connect.Close();
            return RedirectToAction("Index");
        }
        #endregion
    }
}
