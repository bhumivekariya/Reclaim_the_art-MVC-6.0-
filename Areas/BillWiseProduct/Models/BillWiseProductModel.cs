namespace Reclaim_the_art.Areas.BillWiseProduct.Models
{
    public class BillWiseProductModel
    {
        public int BillWiseProductID { get; set; }
        public string Quantity { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }
        public int BillID { get; set; }
        public int ProductID { get; set; }

    }
}
