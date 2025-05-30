using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Variant1_Mozaika.DataBaseConnect;

namespace Variant1_Mozaika.Windows
{   
    // Отдельный метод для 4 модуля.
    // Отдельный метод для 4 модуля.
    // Отдельный метод для 4 модуля.
    // Отдельный метод для 4 модуля.
    // Отдельный метод для 4 модуля.

        public static class CalculationHelper
        {
            public static int CalculateProductQuantity(int productTypeId, int materialTypeId,
                                                      int rawMaterialAmount, double param1, double param2)
            {
                // Валидация входных параметров
                if (rawMaterialAmount < 0 || param1 <= 0 || param2 <= 0)
                    return -1;

                try
                {
                    // Проверка существования типа продукции
                    var productType = AppConnect.MozaikaBD.ProductTypes
                        .FirstOrDefault(pt => pt.ProductTypeID == productTypeId);
                    if (productType == null)
                        return -1;

                    // Проверка существования типа материала
                    var materialType = AppConnect.MozaikaBD.MaterialTypes
                        .FirstOrDefault(mt => mt.MaterialTypeID == materialTypeId);
                    if (materialType == null)
                        return -1;

                    // Количество сырья на единицу продукции = param1 * param2 * коэффициент типа продукции
                    double rawMaterialPerUnit = param1 * param2 * (double)productType.Coefficient;

                    // Учет потерь: увеличиваем необходимое сырье
                    double lossPercentage = (double)materialType.LossPercentage;
                    double adjustedRawMaterialPerUnit = rawMaterialPerUnit / (1 - lossPercentage / 100);

                    // Вычисление количества продукции
                    int productQuantity = (int)(rawMaterialAmount / adjustedRawMaterialPerUnit);

                    return productQuantity;
                }
                catch
                {
                    return -1;
                }
            }
        }
}
