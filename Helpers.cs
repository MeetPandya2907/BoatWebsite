using System;

namespace BoatWebsite
{
    public static class Helpers
    {
        public static string GetStars(object ratingObj)
        {
            try
            {
                decimal rating = Convert.ToDecimal(ratingObj);
                int full = (int)Math.Floor(rating);
                int empty = 5 - full;
                string stars = "";
                for (int i = 0; i < full; i++) stars += "★";
                for (int i = 0; i < empty; i++) stars += "☆";
                return stars;
            }
            catch { return "★★★★☆"; }
        }

        public static string GetReviewCount(object countObj)
        {
            try
            {
                int count = Convert.ToInt32(countObj);
                return count >= 1000 ? (count / 1000.0).ToString("F1") + "K" : count.ToString();
            }
            catch { return "0"; }
        }
    }
}