
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

        public static List<Member> Create( string membername, string phoneNumber)
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
                }
            );
            SaveAll(members);
            return members;
        }

       

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

            //InventoryService.DeleteByUserId(id);
            members.Remove(member);
            SaveAll(members);

            return members;
        }

        //public static Member Login(string membername, string password)
        //{
        //    var loginErrorMessage = "Invalid membername or password.";
        //    List<Member> members = GetAll();
        //    Member member = members.FirstOrDefault(x => x.Membername == membername);

        //    if (member == null)
        //    {
        //        throw new Exception(loginErrorMessage);
        //    }

        //    bool passwordIsValid = Utils.VerifyHash(password, member.PasswordHash);

        //    if (!passwordIsValid)
        //    {
        //        throw new Exception(loginErrorMessage);
        //    }

        //    return member;
        //}

        public static Member ChangePhoneNumber(Guid id, string newPassword)
        {
            //if (currentPassword == newPassword)
            //{
            //    throw new Exception("New password must be different from current password.");
            //}

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
