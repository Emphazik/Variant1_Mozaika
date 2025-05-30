using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using static Variant1_Mozaika.Models.Suppliers;
using Variant1_Mozaika.DataBaseConnect;
using Variant1_Mozaika.Models;

namespace Variant1_Mozaika.Windows
{
    /// <summary>
    /// Логика взаимодействия для SuppliersWindow.xaml
    /// </summary>
    public partial class SuppliersWindow : Window
    {
        private Materials _material;

        public SuppliersWindow(Materials material)
        {
            InitializeComponent();
            _material = material;
            LoadSuppliers();
        }

        private void LoadSuppliers()
        {
            try
            {
                var suppliers = AppConnect.MozaikaBD.MaterialSuppliers
                    .Where(ms => ms.MaterialID == _material.MaterialID)
                    .Select(ms => new SupplierViewModel
                    {
                        SupplierName = ms.Suppliers.SupplierName,
                        Rating = ms.Suppliers.Rating,
                        StartDate = ms.Suppliers.StartDate
                    })
                    .ToList();

                SuppliersListView.ItemsSource = suppliers;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки поставщиков: {ex.Message}", "Ошибка",
                                MessageBoxButton.OK, MessageBoxImage.Error);
                Close();
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
