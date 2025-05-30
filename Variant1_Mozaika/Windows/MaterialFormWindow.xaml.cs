using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
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

            // Если редактируем, заполняем числовые поля
            if (_isEditing)
            {
                StockQuantityTextBox.Text = _material.StockQuantity.ToString("F2", CultureInfo.CurrentCulture);
                PackageQuantityTextBox.Text = _material.PackageQuantity.ToString("F2", CultureInfo.CurrentCulture);
                MinimumQuantityTextBox.Text = _material.MinimumQuantity.ToString("F2", CultureInfo.CurrentCulture);
                UnitPriceTextBox.Text = _material.UnitPrice.ToString("F2", CultureInfo.CurrentCulture);
            }
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
            // Валидация строковых полей
            if (string.IsNullOrWhiteSpace(_material.MaterialName))
            {
                MessageBox.Show("Наименование материала не может быть пустым. Пожалуйста, введите корректное значение.",
                                "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (MaterialTypeComboBox.SelectedItem == null)
            {
                MessageBox.Show("Выберите тип материала из списка.", "Ошибка",
                                MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (UnitComboBox.SelectedItem == null)
            {
                MessageBox.Show("Выберите единицу измерения из списка.", "Ошибка",
                                MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Валидация числовых полей с учетом локализации
            if (!decimal.TryParse(StockQuantityTextBox.Text, NumberStyles.Any, CultureInfo.CurrentCulture, out decimal stockQuantity) || stockQuantity < 0)
            {
                MessageBox.Show("Количество на складе должно быть неотрицательным числом. Пожалуйста, введите корректное значение.",
                                "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (!decimal.TryParse(PackageQuantityTextBox.Text, NumberStyles.Any, CultureInfo.CurrentCulture, out decimal packageQuantity) || packageQuantity <= 0)
            {
                MessageBox.Show("Количество в упаковке должно быть положительным числом. Пожалуйста, введите корректное значение.",
                                "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (!decimal.TryParse(MinimumQuantityTextBox.Text, NumberStyles.Any, CultureInfo.CurrentCulture, out decimal minimumQuantity) || minimumQuantity < 0)
            {
                MessageBox.Show("Минимальное количество должно быть неотрицательным числом. Пожалуйста, введите корректное значение.",
                                "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (!decimal.TryParse(UnitPriceTextBox.Text, NumberStyles.Any, CultureInfo.CurrentCulture, out decimal unitPrice) || unitPrice < 0)
            {
                MessageBox.Show("Цена единицы материала должна быть неотрицательной. Пожалуйста, введите корректное значение.",
                                "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Присваивание значений объекту Materials
            _material.StockQuantity = stockQuantity;
            _material.PackageQuantity = packageQuantity;
            _material.MinimumQuantity = minimumQuantity;
            _material.UnitPrice = unitPrice;

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

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
            Close();
        }
    }
}
