﻿using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Reclaim_the_art.Areas.ProductType.Models
{
    public class ProductTypeModel
    {
        public int ProductTypeID { get; set; }
        [Required]
        [DisplayName("Please enter")]
        public string ProductType { get; set; }
        public DateTime CreationDate    { get; set; }
        public DateTime ModificationDate { get; set; }


    }
    public class ProductTypeDropDownModel
    {
        public int ProductTypeID { get; set; }
        public string ProductType { get; set; }
    }
}
