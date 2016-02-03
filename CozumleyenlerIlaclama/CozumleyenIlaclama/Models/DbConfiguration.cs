using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace CozumleyenIlaclama.Models
{
    public class DbConfiguration
    {
        public static string ConnectionString = @"Server=.;Database=CozumleyenlerIlaclama;Trusted_Connection=true;"; // Local
      
        
    }
}