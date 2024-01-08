using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BisleriumCafe.Data
{
    public class Member
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        public string Membername { get; set; }

        public string PhoneNumber { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public Guid CreatedBy { get; set; }

        public int OrderCount { get; set; }

        public int MembershipType { get; set; }

    }
}
