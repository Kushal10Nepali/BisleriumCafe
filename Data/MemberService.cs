
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;


namespace BisleriumCafe.Data
{

    public class MemberService
    {
       private List <CoffeeTaken> _items = new List <CoffeeTaken>();
       private List <Member> _members = new List <Member>();

        //Saves a member to the list .
        private static void SaveAll(List<Member> members)
        {
            string appDataDirectoryPath = Utils.GetAppDirectoryPath();
            string appMembershipFilePath = Utils.GetAppMembershipFilePath();

            if (!Directory.Exists(appDataDirectoryPath))
            {
                Directory.CreateDirectory(appDataDirectoryPath);
            }

            var json = JsonSerializer.Serialize(members);
            File.WriteAllText(appMembershipFilePath, json);
        }


        //Retrieves all members 
        public static List<Member> GetAll()
        {
            string appMembershipFilePath = Utils.GetAppMembershipFilePath();
            if (!File.Exists(appMembershipFilePath))
            {
                return new List<Member>();
            }

            var json = File.ReadAllText(appMembershipFilePath);
            return JsonSerializer.Deserialize<List<Member>>(json);
        }

        //Creates a member and adds to the list 
        public static List<Member> Create( string membername, string phoneNumber ,int orderCount)
        {
            List<Member> members = GetAll();
            bool membernameExists = members.Any(x => x.Membername == membername);

            if (membernameExists)
            {
                throw new Exception("Membername already exists.");
            }

            members.Add(
                new Member
                {
                    Membername = membername,
                    PhoneNumber = phoneNumber,
                    //CreatedBy = userId
                    OrderCount = orderCount,
                }
            );
            SaveAll(members);
            return members;
        }

        //public static List<Member> UpdateOrderCountN(int orderCount)
        //{
        //    List<Member> members = GetAll();
        //    //bool membernameExists = members.Any(x => x.Membername == membername);


        //    members.Add(
        //        new Member
        //        {
                    
        //            OrderCount = orderCount,
        //        }
        //    );
        //    SaveAll(members);
        //    return members;
        //}




        public static Member GetById(Guid id)
        {

            List<Member> members = GetAll();

            return members.FirstOrDefault(x => x.Id == id);
        }

       


        public static List<Member> Delete(Guid id)
        {
            List<Member> members = GetAll();
            Member member = members.FirstOrDefault(x => x.Id == id);

            if (member == null)
            {
                throw new Exception("Member not found.");
            }

         
            members.Remove(member);
            SaveAll(members);

            return members;
        }


        public static Member ChangePhoneNumber(Guid id, string newPassword)
        {

            List<Member> members = GetAll();
            Member member = members.FirstOrDefault(x => x.Id == id);

            if (member == null)
            {
                throw new Exception("Member not found.");
            }

            SaveAll(members);

            return member;
        }

       



    }
}


