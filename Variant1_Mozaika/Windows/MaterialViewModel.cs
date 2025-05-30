using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Variant1_Mozaika.Windows
{
    public class MaterialViewModel
    {
        public int MaterialID { get; set; }
        public string MaterialName { get; set; }
        public string MaterialTypeName { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal StockQuantity { get; set; }
        public decimal MinimumQuantity { get; set; }
        public decimal PackageQuantity { get; set; }
        public string UnitName { get; set; }
        public decimal BatchCost { get; set; }
    }

}
