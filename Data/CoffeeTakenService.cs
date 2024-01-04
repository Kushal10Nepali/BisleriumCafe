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

            public static List<CoffeeTaken> Create( string itemName,  int totalamount , string takenBy  )
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

