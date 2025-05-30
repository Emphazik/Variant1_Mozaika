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
using System.Windows.Navigation;
using System.Windows.Shapes;
using static Variant1_Mozaika.Models.Materials;
using Variant1_Mozaika.DataBaseConnect;
using Variant1_Mozaika.Windows;
using Variant1_Mozaika.Models;

namespace Variant1_Mozaika
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            LoadMaterials();
        }

        private void LoadMaterials()
        {
            try
            {
                // Сначала загружаем данные из базы в память
                var materialsData = AppConnect.MozaikaBD.Materials
                    .Select(m => new
                    {
                        m.MaterialID,
                        m.MaterialName,
                        MaterialTypeName = m.MaterialTypes.MaterialTypeName,
                        m.UnitPrice,
                        m.StockQuantity,
                        m.MinimumQuantity,
                        m.PackageQuantity,
                        UnitName = m.Units.UnitName
                    })
                    .ToList();

                // Теперь выполняем расчет стоимости партии на стороне C#
                var materials = materialsData
                    .Select(m => new Materials.MaterialViewModel
                    {
                        MaterialID = m.MaterialID,
                        MaterialName = m.MaterialName,
                        MaterialTypeName = m.MaterialTypeName,
                        UnitPrice = m.UnitPrice,
                        StockQuantity = m.StockQuantity,
                        MinimumQuantity = m.MinimumQuantity,
                        PackageQuantity = m.PackageQuantity,
                        UnitName = m.UnitName,
                        BatchCost = CalculateBatchCost(m.StockQuantity, m.MinimumQuantity,
                                                       m.PackageQuantity, m.UnitPrice)
                    })
                    .ToList();

                MaterialsListView.ItemsSource = materials;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки материалов: {ex.Message}", "Ошибка",
                                MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private decimal CalculateBatchCost(decimal stockQuantity, decimal minimumQuantity,
                                          decimal packageQuantity, decimal unitPrice)
        {
            if (stockQuantity >= minimumQuantity)
                return 0.00m;

            decimal shortage = minimumQuantity - stockQuantity;
            decimal packagesNeeded = Math.Ceiling(shortage / packageQuantity);
            decimal totalQuantityToBuy = packagesNeeded * packageQuantity;
            decimal cost = totalQuantityToBuy * unitPrice;

            return Math.Round(cost, 2);
        }

        private void AddMaterial_Click(object sender, RoutedEventArgs e)
        {
            var materialForm = new MaterialFormWindow(null);
            if (materialForm.ShowDialog() == true)
            {
                LoadMaterials();
            }
        }

        private void EditMaterial_Click(object sender, RoutedEventArgs e)
        {
            if (MaterialsListView.SelectedItem == null)
            {
                MessageBox.Show("Выберите материал для редактирования.", "Ошибка",
                                MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            var selectedMaterial = (Materials.MaterialViewModel)MaterialsListView.SelectedItem;
            var material = AppConnect.MozaikaBD.Materials.Find(selectedMaterial.MaterialID);
            var materialForm = new MaterialFormWindow(material);
            if (materialForm.ShowDialog() == true)
            {
                LoadMaterials();
            }
        }

        private void MaterialsListView_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            EditMaterial_Click(sender, e);
        }

        private void MaterialsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            EditButton.IsEnabled = MaterialsListView.SelectedItem != null;
        }

        private void ShowSuppliers_Click(object sender, RoutedEventArgs e)
        {
            if (MaterialsListView.SelectedItem == null)
            {
                MessageBox.Show("Выберите материал для отображения поставщиков.", "Ошибка",
                                MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            var selectedMaterial = (Materials.MaterialViewModel)MaterialsListView.SelectedItem;
            var material = AppConnect.MozaikaBD.Materials.Find(selectedMaterial.MaterialID);
            var suppliersWindow = new SuppliersWindow(material);
            suppliersWindow.ShowDialog();
        }
    }
}
