using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BisleriumCafe.Data
{
    public class CoffeeTaken
    {
        public Guid Id { get; set; } = Guid.NewGuid();


        public string ItemName { get; set; }

        public int Quantity { get; set; }

        //public String Category { get; set; }

        public Guid TakenBy { get; set; }
        //public Guid ApprovedBy { get; set; }

        public DateTime TakenAt { get; set; } = DateTime.Now;
        public int ItemPrice { get;  set; }

        public int TotalAmount { get; set; }

        public string  MembershipVerificationId { get; set; }

        
    }
}

