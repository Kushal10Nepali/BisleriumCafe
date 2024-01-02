using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BisleriumCafe.Data
{
    public class CoffeeItems
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        [Required(ErrorMessage = "Please provide the coffee items name.")]

        public string ItemName { get; set; }

        public int Quantity { get; set; }

        public int ItemPrice { get; set; }

        [Required(ErrorMessage = "Please provide the inventory description.")]

        public string Description { get; set; }

        public  string Category { get; set; }

        public Guid CreatedBy { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        public Boolean isOutOfStock { get; set; } = false;
    }
}
