﻿using Microsoft.AspNet.Identity;
using ProjectMeowth.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;

namespace ProjectMeowth.Helpers
{
    public static class AccountHelper
    {
        public static bool IsLoggedIn()
        {
            bool val1 = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            return val1;
        }

        public static String GetUsername()
        {
            string userName = string.Empty;

            if (System.Web.HttpContext.Current != null &&
                System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                var usr = HttpContext.Current.User.Identity;
                if (usr != null)
                {
                    userName = usr.Name;
                }
            }

            return userName;
        }

        public static string GetPlayerName(this IIdentity identity)
        {
            if(identity == null)
            {
                throw new ArgumentException("Identity is null!");
            }

            var ci = identity as ClaimsIdentity;
            if(ci != null)
            {
                return ci.FindFirstValue("PlayerName");
            }
            return "Anonymous PlayerName";
        }

        public static string GetTeamName(this IIdentity identity)
        {
            if (identity == null)
            {
                throw new ArgumentException("Identity is null!");
            }

            var ci = identity as ClaimsIdentity;
            if (ci != null)
            {
                return ci.FindFirstValue("TeamName");
            }
            return "Team Rocket?";
        }

        public static int GetGameExperience(this IIdentity identity)
        {
            int exp = -1;

            if (identity == null)
            {
                throw new ArgumentException("Identity is null!");
            }

            var ci = identity as ClaimsIdentity;
            if (ci != null)
            {
                string result = ci.FindFirstValue("Exp");
                int.TryParse(result, out exp);
                return exp;
            }
            return -2;
        }

        public static int ConvertExpToLevel(int exp)
        {
            int output = 42;
            switch(exp)
            {
                case int n when (n >= 5000000): output = 40; break;
                case int n when (n >= 3000000): output = 39; break;
                case int n when (n >= 2500000): output = 38; break;
                case int n when (n >= 2000000): output = 37; break;
                case int n when (n >= 1500000): output = 36; break;
                case int n when (n >= 1250000): output = 35; break;
                case int n when (n >= 1000000): output = 34; break;
                case int n when (n >= 750000): output = 33; break;
                case int n when (n >= 500000): output = 32; break;
                case int n when (n >= 500000): output = 31; break;
                case int n when (n >= 350000): output = 30; break;
                case int n when (n >= 300000): output = 29; break;
                case int n when (n >= 250000): output = 28; break;
                case int n when (n >= 200000): output = 27; break;
                case int n when (n >= 190000): output = 26; break;
                case int n when (n >= 150000): output = 25; break;
                case int n when (n >= 125000): output = 24; break;
                case int n when (n >= 100000): output = 23; break;
                case int n when (n >= 75000): output = 22; break;
                case int n when (n >= 50000): output = 21; break;
                case int n when (n >= 25000): output = 20; break;
                case int n when (n >= 25000): output = 19; break;
                case int n when (n >= 20000): output = 18; break;
                case int n when (n >= 20000): output = 17; break;
                case int n when (n >= 20000): output = 16; break;
                case int n when (n >= 15000): output = 15; break;
                case int n when (n >= 10000): output = 14; break;
                case int n when (n >= 10000): output = 13; break;
                case int n when (n >= 10000): output = 12; break;
                case int n when (n >= 10000): output = 11; break;
                case int n when (n >= 9000): output = 10; break;
                case int n when (n >= 8000): output = 9; break;
                case int n when (n >= 7000): output = 8; break;
                case int n when (n >= 6000): output = 7; break;
                case int n when (n >= 5000): output = 6; break;
                case int n when (n >= 4000): output = 5; break;
                case int n when (n >= 3000): output = 4; break;
                case int n when (n >= 2000): output = 3; break;
                case int n when (n >= 1000): output = 2; break;
                case int n when (n >= 0): output = 1; break;
                default: output = 43; break;

            }
            return output;
        }
    }
}