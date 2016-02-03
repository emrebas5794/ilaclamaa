using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CozumleyenIlaclama.Models
{
    public class Sozlesme
    {
        public string HizmetTipi { get; set; }
        public string Personel { get; set; }
        public DateTime TarihSaat { get; set; }
        public string Aciklama { get; set; }
        public string MusteriAd { get; set; }
    }
}