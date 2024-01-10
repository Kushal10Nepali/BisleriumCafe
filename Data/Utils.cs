﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace BisleriumCafe.Data
{
    internal class Utils
    {
        private const char _segmentDelimiter = ':';

        //hashes a secret using PBKDF2 with SHA-256 algorithm.
        public static string HashSecret(string input)
        {
            var saltSize = 16;
            var iterations = 100_000;
            var keySize = 32;
            HashAlgorithmName algorithm = HashAlgorithmName.SHA256;
            byte[] salt = RandomNumberGenerator.GetBytes(saltSize);
            byte[] hash = Rfc2898DeriveBytes.Pbkdf2(input, salt, iterations, algorithm, keySize);

            return string.Join(
                _segmentDelimiter,
                Convert.ToHexString(hash),
                Convert.ToHexString(salt),
                iterations,
                algorithm
            );
        }

        //verifies if a given input matches the hashed value.
        public static bool VerifyHash(string input, string hashString)
        {
            string[] segments = hashString.Split(_segmentDelimiter);
            byte[] hash = Convert.FromHexString(segments[0]);
            byte[] salt = Convert.FromHexString(segments[1]);
            int iterations = int.Parse(segments[2]);
            HashAlgorithmName algorithm = new(segments[3]);
            byte[] inputHash = Rfc2898DeriveBytes.Pbkdf2(
                input,
                salt,
                iterations,
                algorithm,
                hash.Length
            );

            return CryptographicOperations.FixedTimeEquals(inputHash, hash);
        }


        // directory path of the application.
        public static string GetAppDirectoryPath()
        {
            return @"C:\AppDevCourseWork\BisleriumCafe-Rejina";
        }

        //returns the full file path for the users' data
        public static string GetAppUsersFilePath()
        {
            return Path.Combine(GetAppDirectoryPath(), "users.json");
        }

        //returns the full file path for the members' data
        public static string GetAppMembershipFilePath()
        {
            return Path.Combine(GetAppDirectoryPath(), "membership.json");
        }


        //returns the full file path for the items data
        public static string GetCoffeeInventoryFilePath()
        {
            return Path.Combine(GetAppDirectoryPath(), "coffeeItems.json");
        }

        //returns the full file path for the order data
        public static string GetCoffeeInventoryTakePath()
        {
            return Path.Combine(GetAppDirectoryPath(), "coffeeItemsTaken.json");
        }
    }
}
