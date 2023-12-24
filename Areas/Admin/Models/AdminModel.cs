using Microsoft.Build.Framework;
using System.ComponentModel;

namespace Reclaim_the_art.Areas.Admin.Models
{
    public class AdminModel
    {



        public int AdminID { get; set; }
        [Required]
        public string AdminName { get; set; }
        [Required]
        public string AdminUserName { get; set; }
        [Required]
        public string AdminPassWord { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }

    }
}
