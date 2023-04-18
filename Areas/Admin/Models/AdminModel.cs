namespace Reclaim_the_art.Areas.Admin.Models
{
    public class AdminModel
    {
        public int AdminID { get; set; }
        public string AdminName { get; set; }
        public string AdminUserName { get; set; }
        public string AdminPassWord { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }

    }
}
