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

namespace DriveUrselfProducts
{
    /// <summary>
    /// Логика взаимодействия для SelectedProduct.xaml
    /// </summary>
    public partial class SelectedProduct : Window
    {
        private DriveUrselfProductsDBEntities1 dup;

        private int productID;

        public SelectedProduct(string selectedProduct)
        {
            InitializeComponent();

            dup = new DriveUrselfProductsDBEntities1();

            productID = Convert.ToInt32(selectedProduct.Split('_')[1]);

            product product = dup.product.Find(Convert.ToInt32(selectedProduct.Split('_')[1]));

            MainImg.Source = new BitmapImage(new Uri(@"pack://siteoforigin:,,,/" + product.C_Главное_изображение));

            name.Text = product.Наименование_товара;
            proz.Text = product.C_Производитель;
            Active.Text = product.C_Активен_;
            cost.Text = product.C_Цена;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            dup.product.Find(Convert.ToInt32(productID)).C_Цена = cost.Text;
            dup.product.Find(Convert.ToInt32(productID)).C_Производитель = proz.Text;
            dup.product.Find(Convert.ToInt32(productID)).C_Активен_ = Active.Text;
            dup.product.Find(Convert.ToInt32(productID)).Наименование_товара = name.Text;

            dup.SaveChanges();

            this.Close();
        }
    }
}
