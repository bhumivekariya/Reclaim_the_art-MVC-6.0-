
namespace Reclaim_the_art.Areas.Product.Models
{
    public class ProductModel
    {
        public int ProductID { get; set; } 
        public string? ProductName { get; set; }

        public IFormFile File { get; set; }
        public string? ProductPicture { get; set; }
        public string? ProductDiscription { get; set; }
        public int ProductPrice { get; set; }

        public string? ProductDiscount { get; set; }
        public int ProductTypeID { get; set; }

        public int CustomerID { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }

    }

    public class ProductNameDropDownModel
    {
        public int ProductID { get; set; }
        public string? ProductName { get; set; }
    }
}
