using System.ComponentModel.DataAnnotations;

namespace Reclaim_the_art.Areas.State.Models
{
    public class StateModel
    {
        public int? StateID { get; set; }
        [Required]
        public string? StateName { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }
        [Required]
        public int CountryID { get; set; }
    }
    public class StateDropDownModel
    {
        public int? StateID { get; set; }
        public string? StateName { get; set; }
    }
}
