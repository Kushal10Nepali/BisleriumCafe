using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace BisleriumCafe.Data
{
    public class CoffeeTakenService
    {

        private static void SaveAll(List<CoffeeTaken> todos)
        {
            string appDataDirectoryPath = Utils.GetAppDirectoryPath();
            string todosFilePath = Utils.GetCoffeeInventoryTakePath();

            if (!Directory.Exists(appDataDirectoryPath))
            {
                Directory.CreateDirectory(appDataDirectoryPath);
            }

            var json = JsonSerializer.Serialize(todos);
            File.WriteAllText(todosFilePath, json);
        }

        public static List<CoffeeTaken> GetAll()
        {
            string todosFilePath = Utils.GetCoffeeInventoryTakePath();
            if (!File.Exists(todosFilePath))
            {
                return new List<CoffeeTaken>();
            }

            var json = File.ReadAllText(todosFilePath);

            return JsonSerializer.Deserialize<List<CoffeeTaken>>(json);
        }

        public static List<CoffeeTaken> Create(string itemName, int totalamount, Guid takenBy, string membershipVerficationId, string[] addons)
        {

            List<CoffeeTaken> items = GetAll();
            items.Add(new CoffeeTaken
            {
                ItemName = itemName,
                TakenAt = DateTime.Now,
                TakenBy = takenBy,
                //Quantity = qty,
                TotalAmount = totalamount,
                //ApprovedBy = approvedBy,
                MembershipVerificationId = membershipVerficationId,
                Addons=addons,
            });
            SaveAll(items);
            return items;
        }

        public static List<CoffeeTaken> Delete(Guid id)
        {
            List<CoffeeTaken> items = GetAll();
            CoffeeTaken item = items.FirstOrDefault(x => x.Id == id);

            if (item == null)
            {
                throw new Exception("Item not found.");
            }

            items.Remove(item);
            SaveAll(items);
            return items;
        }

        public static List<CoffeeTaken> GetMostSoldItems()
        {
            List<CoffeeTaken> items = GetAll(); // Assuming GetAll() retrieves all coffee items taken
            Dictionary<string, int> itemCounts = new Dictionary<string, int>();

            // Count occurrences of each item
            foreach (var item in items)
            {
                if (itemCounts.ContainsKey(item.ItemName))
                {
                    itemCounts[item.ItemName]++;
                }
                else
                {
                    itemCounts[item.ItemName] = 1;
                }
            }

            // Sort items by count in descending order
            var sortedItems = itemCounts.OrderByDescending(kv => kv.Value);

            // Get the most sold items
            var mostSoldItems = sortedItems.Take(5) // Change 5 to the number of top items you want to display
                                             .Select(kv => new CoffeeTaken { ItemName = kv.Key })
                                             .ToList();

            return mostSoldItems;
        }

        public static List<string> GetMostSoldAddins()
        {
            List<CoffeeTaken> items = GetAll(); // Assuming GetAll() retrieves all coffee items taken
            Dictionary<string, int> addonCounts = new Dictionary<string, int>();

            // Count occurrences of each add-in
            foreach (var item in items)
            {
                foreach (var addon in item.Addons)
                {
                    if (addonCounts.ContainsKey(addon))
                    {
                        addonCounts[addon]++;
                    }
                    else
                    {
                        addonCounts[addon] = 1;
                    }
                }
            }

            // Sort add-ins by count in descending order
            var sortedAddons = addonCounts.OrderByDescending(kv => kv.Value);

            // Get the most sold add-ins
            var mostSoldAddins = sortedAddons.Take(5) // Change 5 to the number of top add-ins you want to display
                                             .Select(kv => kv.Key)
                                             .ToList();

            return mostSoldAddins;
        }

        private Dictionary<string, int> orderCountByMembershipId;

        protected  void LoadData()
        {
            // Call the method to get all coffee items taken
            List<CoffeeTaken> items = CoffeeTakenService.GetAll();

            // Initialize the dictionary
            orderCountByMembershipId = new Dictionary<string, int>();

            // Count occurrences of each item by MembershipVerificationId
            foreach (var item in items)
            {
                if (orderCountByMembershipId.ContainsKey(item.MembershipVerificationId))
                {
                    orderCountByMembershipId[item.MembershipVerificationId]++;
                }
                else
                {
                    orderCountByMembershipId[item.MembershipVerificationId] = 1;
                }
            }
        }



        //public static List<CoffeeTaken> Approve(Guid id, Guid approvedBy)
        //{
        //    List<CoffeeTaken> items = GetAll();
        //    CoffeeTaken itemToUpdate = items.FirstOrDefault(x => x.Id == id);

        //    if (itemToUpdate == null)
        //    {
        //        throw new Exception("Item not found.");
        //    }
        //    //itemToUpdate.ApprovedBy = approvedBy;
        //    SaveAll(items);
        //    return items;
        //}

        public static List<CoffeeTaken> getBarData()
        {
            List<CoffeeTaken> items = GetAll();

            List<CoffeeTaken> filteredItems = new List<CoffeeTaken>();

            foreach (CoffeeTaken inventoryItem in items)
            {
                CoffeeTaken itemToUpdate = filteredItems.FirstOrDefault(x => x.ItemName == inventoryItem.ItemName);

                if (itemToUpdate == null)
                {
                    filteredItems.Add(itemToUpdate);
                }
                else
                {
                    itemToUpdate.Quantity++;
                }

            }

            return filteredItems;
        }

    }
}

