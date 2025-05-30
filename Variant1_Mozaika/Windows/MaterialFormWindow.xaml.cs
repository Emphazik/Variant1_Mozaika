using System;
using System.Collections.Generic;
using System.ComponentModel;
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
using Variant1_Mozaika.DataBaseConnect;
using Variant1_Mozaika.Models;

namespace Variant1_Mozaika.Windows
{
    /// <summary>
    /// Логика взаимодействия для MaterialFormWindow.xaml
    /// </summary>
    public partial class MaterialFormWindow : Window
    {
        private Materials _material;
        private bool _isEditing;

        public MaterialFormWindow(Materials material)
        {
            InitializeComponent();
            _isEditing = material != null;
            _material = material ?? new Materials();

            // Загрузка данных в ComboBox
            LoadComboBoxData();

            // Установка DataContext для привязки данных
            DataContext = _material;

            // Установка заголовка окна
            Title = _isEditing ? "Редактирование материала" : "Добавление материала";
        }

        private void LoadComboBoxData()
        {
            try
            {
                MaterialTypeComboBox.ItemsSource = AppConnect.MozaikaBD.MaterialTypes.ToList();
                UnitComboBox.ItemsSource = AppConnect.MozaikaBD.Units.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки данных: {ex.Message}", "Ошибка",
                                MessageBoxButton.OK, MessageBoxImage.Error);
                Close();
            }
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            // Проверка ошибок валидации через IDataErrorInfo
            var errors = GetValidationErrors();
            if (!string.IsNullOrEmpty(errors))
            {
                MessageBox.Show(errors, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            try
            {
                if (!_isEditing)
                {
                    AppConnect.MozaikaBD.Materials.Add(_material);
                }
                AppConnect.MozaikaBD.SaveChanges();
                DialogResult = true;
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка сохранения материала: {ex.Message}", "Ошибка",
                                MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private string GetValidationErrors()
        {
            var errorInfo = _material as IDataErrorInfo;
            if (errorInfo == null) return string.Empty;

            string errors = string.Empty;
            string[] properties = { nameof(_material.MaterialName), nameof(_material.MaterialTypeID),
                                    nameof(_material.UnitID), nameof(_material.StockQuantity),
                                    nameof(_material.PackageQuantity), nameof(_material.MinimumQuantity),
                                    nameof(_material.UnitPrice) };

            foreach (var property in properties)
            {
                var error = errorInfo[property];
                if (!string.IsNullOrEmpty(error))
                {
                    errors += $"{error}\n";
                }
            }

            return errors;
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
            Close();
        }
    }
}
