
//using Intents;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace BisleriumCafe.Data
{
    public static class CoffeeItemService
    {
        public static void SaveAll(List<CoffeeItems> coffees)
        {
            string appDataDirectoryPath = Utils.GetAppDirectoryPath();
            string coffeeFilePath = Utils.GetCoffeeInventoryFilePath();

            if (!Directory.Exists(appDataDirectoryPath))
            {
                Directory.CreateDirectory(appDataDirectoryPath);
            }

            var json = JsonSerializer.Serialize(coffees);
            File.WriteAllText(coffeeFilePath, json);
        }

        public static List<CoffeeItems> GetAll()
        {
            string inventoryFilePath = Utils.GetCoffeeInventoryFilePath();
            if (!File.Exists(inventoryFilePath))
            {
                return new List<CoffeeItems>();
            }

            var json = File.ReadAllText(inventoryFilePath);

            return JsonSerializer.Deserialize<List<CoffeeItems>>(json);
        }

        public static List<CoffeeItems> Create(Guid userId, string itemName, string desc, string cat, int price, int qty, Guid approvedBy)
        {

            List<CoffeeItems> items = GetAll();
            items.Add(new CoffeeItems
            {
                ItemName = itemName,
                CreatedAt = DateTime.Today,
                CreatedBy = userId,
                Description = desc,
                Quantity = qty,
                ItemPrice = price,
                Category = cat,

            });
            SaveAll(items);
            return items;
        }

        //Deletes a menuItem.
        public static List<CoffeeItems> Delete(Guid id)
        {
            List<CoffeeItems> items = GetAll();
            CoffeeItems item = items.FirstOrDefault(x => x.Id == id);

            if (item == null)
            {
                throw new Exception("Item not found.");
            }

            items.Remove(item);
            SaveAll(items);
            return items;
        }


        //Updates and saves  the menuITems.
        public static List<CoffeeItems> Update(Guid id, string itemName, string desc, string cat, int qty, int price, Guid approvedBy)
        {
            List<CoffeeItems> items = GetAll();
            CoffeeItems itemToUpdate = items.FirstOrDefault(x => x.Id == id);

            if (itemToUpdate == null)
            {
                throw new Exception("No updates found.");
            }

            itemToUpdate.ItemName = itemName;
            itemToUpdate.Description = desc;
            itemToUpdate.Quantity = qty;
            itemToUpdate.ItemPrice = price;
            itemToUpdate.Category = cat;
            SaveAll(items);
            return items;
        }

        public static List<CoffeeItems> updatePriceByName(string itemName, int Price)
        {
            List<CoffeeItems> items = GetAll();
            CoffeeItems itemToUpdate = items.FirstOrDefault(x => x.ItemName == itemName);

            if (itemToUpdate == null)
            {
                throw new Exception("No updates found.");
            }

            itemToUpdate.ItemPrice= itemToUpdate.ItemPrice - Price;
            SaveAll(items);
            return items;


        }
    }

}
