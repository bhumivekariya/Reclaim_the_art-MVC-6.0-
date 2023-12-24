namespace Reclaim_the_art.Models
{
    public class ProductsModel
    {
        public int ProductID { get; set; }
        public string? ProductName { get; set; }
        public string ProductDiscription { get; set; }
        public int ProductPrice { get; set; }
        public string ProductDiscount { get; set; }
        public int ProductTypeID { get; set; }
        public int CustomerID { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }
        public string ProductPicture { get; set; }

    }
}
