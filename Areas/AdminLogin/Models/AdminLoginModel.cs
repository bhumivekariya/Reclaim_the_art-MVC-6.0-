namespace Reclaim_the_art.Areas.AdminLogin.Models
{
    public class AdminLoginModel
    {
        public int AdminID { get; set; }
        public string AdminName { get; set; }
        public string AdminUserName { get; set; }
        public string AdminPassWord { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }
    }
}
