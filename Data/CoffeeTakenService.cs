using Microsoft.Maui.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using static iTextSharp.text.pdf.AcroFields;

namespace BisleriumCafe.Data
{
    public class CoffeeTakenService
    {
        //Saves the orderT to a directory. 
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

        //Retrieves all the ordered Items .
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

        //Creates and add an orderT to a list .
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

        //Deletes an orderT from a list .
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


        //retrieves the most sold coffee items based on the count of each item taken.
        //public static List<CoffeeTaken> GetMostSoldItems()
        //{
        //    List<CoffeeTaken> items = GetAll(); // Assuming GetAll() retrieves all coffee items taken
        //    Dictionary<string, int> itemCounts = new Dictionary<string, int>();

        //    // Count occurrences of each item
        //    foreach (var item in items)
        //    {
        //        if (itemCounts.ContainsKey(item.ItemName))
        //        {
        //            itemCounts[item.ItemName]++;
        //        }
        //        else
        //        {
        //            itemCounts[item.ItemName] = 1;
        //        }
        //    }

        //    // Sort items by count in descending orderT
        //    var sortedItems = itemCounts.OrderByDescending(kv => kv.Value);

        //    // Get the most sold items
        //    var mostSoldItems = sortedItems.Take(5) // Change 5 to the number of top items you want to display
        //                                     .Select(kv => new CoffeeTaken { ItemName = kv.Key })
        //                                     .ToList();

        //    return mostSoldItems;
        //}

        public static List<CoffeeTaken> GetMostSoldItems()
        {
            try
            {
                List<CoffeeTaken> items = GetAll(); // Assuming GetAll() retrieves all coffee items taken

                if (items == null)
                {
                    // Handle the case where GetAll() returns null
                    throw new InvalidOperationException("The list of coffee items is null.");
                }

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

                // Sort items by count in descending orderT
                var sortedItems = itemCounts.OrderByDescending(kv => kv.Value);

                // Get the most sold items
                var mostSoldItems = sortedItems.Take(5) // Change 5 to the number of top items you want to display
                                                .Select(kv => new CoffeeTaken { ItemName = kv.Key })
                                                .ToList();

                return mostSoldItems;
            }
            catch (InvalidOperationException ex)
            {
                // Handle specific exception types
                Console.WriteLine($"InvalidOperationException in GetMostSoldItems: {ex.Message}");
                // Log, rethrow, or handle as appropriate
                return new List<CoffeeTaken>();
            }
            catch (Exception ex)
            {
                // Handle other exceptions
                Console.WriteLine($"An error occurred in GetMostSoldItems: {ex.Message}");
                // Log, rethrow, or handle as appropriate
                return new List<CoffeeTaken>();
            }
        }


        //retrieves the most sold addins items based on the count of each item taken.
        //public static List<string> GetMostSoldAddins()
        //{
        //    List<CoffeeTaken> items = GetAll(); // Assuming GetAll() retrieves all coffee items taken
        //    Dictionary<string, int> addonCounts = new Dictionary<string, int>();

        //    // Count occurrences of each add-in
        //    foreach (var item in items)
        //    {
        //        foreach (var addon in item.Addons)
        //        {
        //            if (addonCounts.ContainsKey(addon))
        //            {
        //                addonCounts[addon]++;
        //            }
        //            else
        //            {
        //                addonCounts[addon] = 1;
        //            }
        //        }
        //    }

        //    // Sort add-ins by count in descending orderT
        //    var sortedAddons = addonCounts.OrderByDescending(kv => kv.Value);

        //    // Get the most sold add-ins
        //    var mostSoldAddins = sortedAddons.Take(5) // Change 5 to the number of top add-ins you want to display
        //                                     .Select(kv => kv.Key)
        //                                     .ToList();

        //    return mostSoldAddins;
        //}

        public static List<string> GetMostSoldAddins()
        {
            try
            {
                List<CoffeeTaken> items = GetAll(); // Assuming GetAll() retrieves all coffee items taken

                if (items == null)
                {
                    // Handle the case where GetAll() returns null
                    throw new InvalidOperationException("The list of coffee items is null.");
                }

                Dictionary<string, int> addonCounts = new Dictionary<string, int>();

                // Count occurrences of each add-in
                foreach (var item in items)
                {
                    if (item?.Addons != null)
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
                }

                // Sort add-ins by count in descending orderT
                var sortedAddons = addonCounts.OrderByDescending(kv => kv.Value);

                // Get the most sold add-ins
                var mostSoldAddins = sortedAddons.Take(5) // Change 5 to the number of top add-ins you want to display
                                                 .Select(kv => kv.Key)
                                                 .ToList();

                return mostSoldAddins;
            }
            catch (InvalidOperationException ex)
            {
                // Handle specific exception types
                Console.WriteLine($"InvalidOperationException in GetMostSoldAddins: {ex.Message}");
                // Log, rethrow, or handle as appropriate
                return new List<string>();
            }
            catch (Exception ex)
            {
                // Handle other exceptions
                Console.WriteLine($"An error occurred in GetMostSoldAddins: {ex.Message}");
                // Log, rethrow, or handle as appropriate
                return new List<string>();
            }
        }



        //public static Dictionary<string, List<CoffeeTaken>> GroupOrdersByMembershipId()
        //{
        //    List<CoffeeTaken> orders = CoffeeTakenService.GetAll();

        //    var groupedOrders = orders.GroupBy(orderT => orderT.MembershipVerificationId)
        //                         .ToDictionary(group => group.Key, group => group.ToList());

        //    return groupedOrders;

        //}

        //changed
        public static Dictionary<string, List<CoffeeTaken>> GroupOrdersByMembershipId()
        {
            try
            {
                List<CoffeeTaken> orders = CoffeeTakenService.GetAll();

                var groupedOrders = orders.GroupBy(orderT => orderT.MembershipVerificationId)
                                          .ToDictionary(group => group.Key, group => group.ToList());

                return groupedOrders;
            }
            catch (Exception ex)
            {
                // Log the exception or handle it appropriately based on your application's needs.
                // For example, you might want to log the exception and return an empty dictionary.
                Console.WriteLine($"An error occurred: {ex.Message}");
                return new Dictionary<string, List<CoffeeTaken>>();
            }
        }


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

