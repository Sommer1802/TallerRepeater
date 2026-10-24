using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TallerRepeater
{
    public class ItemComparativa
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Categoria { get; set; }
        public decimal Precio { get; set; }
    }

    public class ArticuloAnime
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Serie { get; set; }
        public string Rareza { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public int Stock { get; set; }
        public string ImagenUrl { get; set; }
    }

    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPunto3Plantillas();
                CargarPunto4ComparativaLive();
                CargarPunto5AnimeStore();
            }
        }
            
        // ==========================================
        // PUNTO 3: 5 PLANTILLAS
        // ==========================================
        private void CargarPunto3Plantillas()
        {
            List<ItemComparativa> productos = new List<ItemComparativa>()
            {
                new ItemComparativa { Id = 1, Nombre = "Consola Nintendo Switch OLED", Categoria = "Consolas", Precio = 349.99m },
                new ItemComparativa { Id = 2, Nombre = "Control Inalámbrico DualSense", Categoria = "Accesorios", Precio = 69.99m },
                new ItemComparativa { Id = 3, Nombre = "Headset HyperX Cloud II", Categoria = "Audio", Precio = 89.50m },
                new ItemComparativa { Id = 4, Nombre = "Silla Gamer Ergonómica", Categoria = "Mobiliario", Precio = 180.00m }
            };

            rptDemoPlantillas.DataSource = productos;
            rptDemoPlantillas.DataBind();
        }

        // ========================================================
        // PUNTO 4: COMPARATIVA EN VIVO CON LOS MISMOS DATOS
        // ========================================================
        private void CargarPunto4ComparativaLive()
        {
            List<ItemComparativa> datosComparativa = new List<ItemComparativa>()
            {
                new ItemComparativa { Id = 101, Nombre = "SSD NVMe 1TB", Categoria = "Almacenamiento", Precio = 95.00m },
                new ItemComparativa { Id = 102, Nombre = "Memoria RAM 16GB DDR4", Categoria = "Hardware", Precio = 45.50m },
                new ItemComparativa { Id = 103, Nombre = "Fuente 750W 80+ Gold", Categoria = "Energía", Precio = 110.00m }
            };

            // 1. Enlazamos al GridView
            gvDemo.DataSource = datosComparativa;
            gvDemo.DataBind();

            // 2. Enlazamos al ListView
            lvDemo.DataSource = datosComparativa;
            lvDemo.DataBind();

            // 3. Enlazamos al Repeater
            rptComparativaLive.DataSource = datosComparativa;
            rptComparativaLive.DataBind();
        }

        // ========================================================
        // PUNTO 5: TIENDA ANIME (GRILLA PERSONALIZADA CON CARDS)
        // ========================================================
        private void CargarPunto5AnimeStore()
        {
            List<ArticuloAnime> catalogo = new List<ArticuloAnime>()
            {
                new ArticuloAnime {
                    Id = 1,
                    Nombre = "Figura Luffy Gear 5 (Sun God Nika)",
                    Serie = "One Piece",
                    Rareza = "Edición Limitada",
                    Descripcion = "Estatua oficial de PVC de 28cm con efectos de rayo translúcidos y nube esculpida.",
                    Precio = 129.99m,
                    Stock = 5,
                    // Si la imagen no carga, cambiar por una local: "~/Imagenes/luffy.jpg"
                    ImagenUrl = "https://images.unsplash.com/photo-1607604276583-eef5d076aa5f?w=600&q=80"
                },
                new ArticuloAnime {
                    Id = 2,
                    Nombre = "Katana Nichirin - Tanjiro Kamado",
                    Serie = "Demon Slayer",
                    Rareza = "Réplica de Acero",
                    Descripcion = "Hoja negra templada en acero al carbono 1045 con tsuba en forma de rueda y saya grabada.",
                    Precio = 89.50m,
                    Stock = 8,
                    // Si la imagen no carga, cambiar por una local: "~/Imagenes/katana.jpg"
                    ImagenUrl = "https://images.unsplash.com/photo-1596727147705-61a532a659bd?w=600&q=80"
                },
                new ArticuloAnime {
                    Id = 3,
                    Nombre = "Figura Satoru Gojo - Hollow Purple",
                    Serie = "Jujutsu Kaisen",
                    Rareza = "Estatua Escala 1/7",
                    Descripcion = "Representación detallada de la técnica vacía morado con base iluminada con luces LED.",
                    Precio = 159.00m,
                    Stock = 3,
                    // Si la imagen no carga, cambiar por una local: "~/Imagenes/gojo.jpg"
                    ImagenUrl = "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=600&q=80"
                }
            };

            rptAnimeStore.DataSource = catalogo;
            rptAnimeStore.DataBind();
        }

        // ========================================================
        // EVENTO DEL BOTÓN "COMPRAR" (OnItemCommand)
        // ========================================================
        protected void rptAnimeStore_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ComprarAnime")
            {
                string[] info = e.CommandArgument.ToString().Split('|');
                string nombre = info[0];
                string precio = info[1];

                lblNotificacionAnime.Text = $"¡Añadido al carrito con éxito!: <strong>{nombre}</strong> por ${precio} USD.";
                lblNotificacionAnime.Visible = true;

                // Mantiene abierta la pestaña 5 después del PostBack
                ClientScript.RegisterStartupScript(this.GetType(), "abrirTab",
                    "document.addEventListener('DOMContentLoaded', function () { new bootstrap.Tab(document.querySelector('#tab-anime-btn')).show(); });", true);
            }
        }
    }
}