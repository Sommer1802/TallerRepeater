<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TallerRepeater.Default" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Taller ASP.NET - Repeater & Comparativas</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;900&display=swap" rel="stylesheet" />

    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #0f111a; color: #e1e7ec; }
        .navbar-custom { background: linear-gradient(135deg, #1f1b2e 0%, #16192b 100%); border-bottom: 2px solid #ff4655; }
        .nav-pills .nav-link { color: #a0aec0; border-radius: 30px; padding: 10px 22px; font-weight: 600; transition: all 0.3s ease; }
        .nav-pills .nav-link.active { background: linear-gradient(45deg, #ff4655, #ff7353); color: white; box-shadow: 0 4px 15px rgba(255, 70, 85, 0.4); }
        .nav-pills .nav-link:hover:not(.active) { color: white; background: rgba(255, 255, 255, 0.05); }

        .fila-par { background-color: #1a1e2e; }
        .fila-impar { background-color: #23283c; border-left: 4px solid #00d2d3; }
        .badge-plantilla { font-size: 0.75rem; font-family: monospace; letter-spacing: 0.5px; }
        .bg-morado { background-color: #a855f7; color: white; }

        .anime-card { background: #181b29; border: 1px solid #282e47; border-radius: 16px; overflow: hidden; transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease; }
        .anime-card:hover { transform: translateY(-8px); border-color: #ff4655; box-shadow: 0 10px 25px rgba(255, 70, 85, 0.25); }
        .anime-img-container { height: 230px; background: #12141f; position: relative; overflow: hidden; }
        .anime-img { width: 100%; height: 100%; object-fit: cover; transition: transform 0.4s ease; }
        .anime-card:hover .anime-img { transform: scale(1.08); }
        .price-tag { font-size: 1.4rem; font-weight: 800; color: #00f2fe; }
        .badge-anime { background: rgba(255, 70, 85, 0.15); color: #ff4655; border: 1px solid #ff4655; }
        .badge-rareza { background: rgba(255, 215, 0, 0.15); color: #ffd700; border: 1px solid #ffd700; }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <header class="navbar-custom py-3 px-4 shadow">
            <div class="container d-flex justify-content-between align-items-center">
                <div class="d-flex align-items-center gap-2">
                    <i class="bi bi-cpu-fill text-danger fs-3"></i>
                    <div>
                        <h5 class="mb-0 fw-bold text-white">UNIVERSIDAD AUTÓNOMA DEL CARIBE</h5>
                        <small class="text-secondary">ASP.NET Web Forms - Segundo Corte</small>
                    </div>
                </div>
                <span class="badge bg-danger px-3 py-2 rounded-pill"><i class="bi bi-star-fill me-1"></i> Control Repeater</span>
            </div>
        </header>

        <div class="container py-4">

            <ul class="nav nav-pills justify-content-center mb-5 gap-2" id="mainTabs" role="tablist">
                <li class="nav-item">
                    <button class="nav-link active" id="tab-plantillas-btn" data-bs-toggle="pill" data-bs-target="#tab-plantillas" type="button">
                        <i class="bi bi-layers-fill me-1"></i> 3. Uso de las 5 Plantillas
                    </button>
                </li>
                <li class="nav-item">
                    <button class="nav-link" id="tab-comparativa-btn" data-bs-toggle="pill" data-bs-target="#tab-comparativa" type="button">
                        <i class="bi bi-diagram-3-fill me-1"></i> 4. Comparativa Visual (Live)
                    </button>
                </li>
                <li class="nav-item">
                    <button class="nav-link" id="tab-anime-btn" data-bs-toggle="pill" data-bs-target="#tab-anime" type="button">
                        <i class="bi bi-fire me-1"></i> 5. Akiba Anime Store (Grilla Propia)
                    </button>
                </li>
            </ul>

            <div class="tab-content" id="mainTabsContent">

                <!-- ========================================== -->
                <!-- PUNTO 3: EVIDENCIA DE LAS 5 PLANTILLAS     -->
                <!-- ========================================== -->
                <div class="tab-pane fade show active" id="tab-plantillas" role="tabpanel">
                    <div class="card bg-dark border-secondary p-4 shadow">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-white fw-bold mb-0">Demostración Anatómica de las 5 Plantillas</h4>
                            <span class="badge bg-info text-dark">Repeater Data-Bound</span>
                        </div>
                        <p class="text-secondary">Cada sección de esta tabla evidencia el rol técnico de cada una de las plantillas del Repeater:</p>

                        <div class="table-responsive">
                            <asp:Repeater ID="rptDemoPlantillas" runat="server">

                                <%-- 1. HeaderTemplate --%>
                                <HeaderTemplate>
                                    <table class="table table-dark table-borderless align-middle mb-0">
                                        <thead>
                                            <tr style="background: #2a203f; border-bottom: 2px solid #a855f7;">
                                                <th><span class="badge bg-morado badge-plantilla">&lt;HeaderTemplate&gt;</span> # ID</th>
                                                <th>Producto</th>
                                                <th>Categoría</th>
                                                <th>Precio</th>
                                                <th>Plantilla en Uso</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>

                                <%-- 2. ItemTemplate (registros 1, 3, 5...) --%>
                                <ItemTemplate>
                                    <tr class="fila-par">
                                        <td class="fw-bold">#<%# Eval("Id") %></td>
                                        <td><%# Eval("Nombre") %></td>
                                        <td><span class="badge bg-secondary"><%# Eval("Categoria") %></span></td>
                                        <td class="text-warning fw-bold">$<%# String.Format("{0:N2}", Eval("Precio")) %></td>
                                        <td><span class="badge bg-primary badge-plantilla">&lt;ItemTemplate&gt;</span></td>
                                    </tr>
                                </ItemTemplate>

                                <%-- 3. AlternatingItemTemplate (registros 2, 4, 6...) --%>
                                <AlternatingItemTemplate>
                                    <tr class="fila-impar">
                                        <td class="fw-bold text-info">#<%# Eval("Id") %></td>
                                        <td class="text-info fw-semibold"><%# Eval("Nombre") %></td>
                                        <td><span class="badge bg-dark border border-info text-info"><%# Eval("Categoria") %></span></td>
                                        <td class="text-warning fw-bold">$<%# String.Format("{0:N2}", Eval("Precio")) %></td>
                                        <td><span class="badge bg-info text-dark badge-plantilla">&lt;AlternatingItemTemplate&gt;</span></td>
                                    </tr>
                                </AlternatingItemTemplate>

                                <%-- 4. SeparatorTemplate (solo entre registros) --%>
                                <SeparatorTemplate>
                                    <tr>
                                        <td colspan="5" class="py-1 px-3 text-center bg-transparent">
                                            <div class="d-flex align-items-center justify-content-center gap-2 text-secondary small">
                                                <span class="border-top border-secondary flex-grow-1"></span>
                                                <span class="badge bg-dark border border-secondary text-secondary badge-plantilla">&lt;SeparatorTemplate&gt;</span>
                                                <span class="border-top border-secondary flex-grow-1"></span>
                                            </div>
                                        </td>
                                    </tr>
                                </SeparatorTemplate>

                                <%-- 5. FooterTemplate --%>
                                <FooterTemplate>
                                        </tbody>
                                        <tfoot>
                                            <tr style="background: #191c2b; border-top: 2px solid #3b82f6;">
                                                <td colspan="5" class="text-center py-3 text-muted">
                                                    <span class="badge bg-success badge-plantilla">&lt;FooterTemplate&gt;</span>
                                                    Fin del Repeater: aquí se cierra la tabla abierta en el HeaderTemplate.
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </FooterTemplate>

                            </asp:Repeater>
                        </div>
                    </div>
                </div>

                <!-- ======================================================== -->
                <!-- PUNTO 4: COMPARATIVA VISUAL (GRIDVIEW vs LISTVIEW vs RPT) -->
                <!-- ======================================================== -->
                <div class="tab-pane fade" id="tab-comparativa" role="tabpanel">
                    <div class="mb-4">
                        <h3 class="text-white fw-bold">Comparativa Visual en Vivo de Controles de Datos</h3>
                        <p class="text-light fs-6">Observa cómo cada control del servidor renderiza <strong>exactamente la misma lista de datos</strong>:</p>
                    </div>

                    <div class="row g-4">

                        <!-- ================= COLUMNA 1: GRIDVIEW ================= -->
                        <div class="col-lg-4">
                            <div class="card bg-dark border border-danger border-opacity-50 h-100 p-4 shadow" style="background-color: #16192b !important;">
                                <div class="d-flex align-items-center justify-content-between mb-3">
                                    <h5 class="text-danger fw-bold mb-0 fs-4">1. GridView</h5>
                                    <span class="badge bg-danger px-3 py-2">Rígido / Pesado</span>
                                </div>

                                <p class="text-light small mb-3">
                                    Genera una etiqueta <code class="text-warning">&lt;table&gt;</code> automática y rígida. Es muy difícil salirse del diseño en columnas sin romper el control.
                                </p>

                                <div class="table-responsive my-auto">
                                    <!-- Control GridView -->
                                    <asp:GridView ID="gvDemo" runat="server" CssClass="table table-dark table-sm table-bordered text-center align-middle mb-0" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-CssClass="fw-bold text-info" />
                                            <asp:BoundField DataField="Nombre" HeaderText="Item" ItemStyle-CssClass="text-light" />
                                            <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="${0:N2}" HtmlEncode="false" ItemStyle-CssClass="text-warning fw-bold" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                                <div class="mt-4 pt-3 border-top border-secondary small text-light">
                                    <div class="mb-1"><i class="bi bi-x-circle-fill text-danger me-2"></i><strong>HTML no personalizable</strong> (solo tablas)</div>
                                    <div><i class="bi bi-check-circle-fill text-success me-2"></i>Paginación y edición CRUD automáticas</div>
                                </div>
                            </div>
                        </div>

                        <!-- ================= COLUMNA 2: LISTVIEW ================= -->
                        <div class="col-lg-4">
                            <div class="card bg-dark border border-warning border-opacity-50 h-100 p-4 shadow" style="background-color: #16192b !important;">
                                <div class="d-flex align-items-center justify-content-between mb-3">
                                    <h5 class="text-warning fw-bold mb-0 fs-4">2. ListView</h5>
                                    <span class="badge bg-warning text-dark px-3 py-2 fw-bold">Flexible / Medio</span>
                                </div>

                                <p class="text-light small mb-3">
                                    Permite definir plantillas libres con <code class="text-info">&lt;LayoutTemplate&gt;</code> y soporta paginación con <code class="text-info">&lt;asp:DataPager&gt;</code>.
                                </p>

                                <div class="my-auto">
                                    <!-- Control ListView -->
                                    <asp:ListView ID="lvDemo" runat="server">
                                        <LayoutTemplate>
                                            <div class="list-group list-group-flush border border-secondary rounded">
                                                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                            </div>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <div class="list-group-item bg-dark text-white border-secondary d-flex justify-content-between align-items-center py-2 px-3">
                                                <span class="text-light fw-medium"><%# Eval("Nombre") %></span>
                                                <span class="badge bg-warning text-dark fw-bold">$<%# String.Format("{0:N2}", Eval("Precio")) %></span>
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>

                                <div class="mt-4 pt-3 border-top border-secondary small text-light">
                                    <div class="mb-1"><i class="bi bi-check-circle-fill text-success me-2"></i>Control de HTML con plantillas</div>
                                    <div><i class="bi bi-exclamation-triangle-fill text-warning me-2"></i>Configuración más compleja y mayor peso</div>
                                </div>
                            </div>
                        </div>

                        <!-- ================= COLUMNA 3: REPEATER ================= -->
                        <div class="col-lg-4">
                            <div class="card bg-dark border border-info border-opacity-75 h-100 p-4 shadow" style="background-color: #141c30 !important;">
                                <div class="d-flex align-items-center justify-content-between mb-3">
                                    <h5 class="text-info fw-bold mb-0 fs-4">3. Repeater</h5>
                                    <span class="badge bg-info text-dark px-3 py-2 fw-bold">100% Control / Liviano</span>
                                </div>

                                <p class="text-light small mb-3">
                                    <strong>Cero HTML predefinido.</strong> Es el más rápido y ligero. Tú tienes el control total para armar tarjetas, listas o chips responsivos:
                                </p>

                                <div class="my-auto">
                                    <!-- Control Repeater -->
                                    <asp:Repeater ID="rptComparativaLive" runat="server">
                                        <HeaderTemplate><div class="d-flex flex-column gap-2"></HeaderTemplate>
                                        <ItemTemplate>
                                            <div class="p-2 px-3 rounded border border-info border-opacity-50 d-flex justify-content-between align-items-center" style="background-color: #1a233d;">
                                                <div class="d-flex align-items-center gap-2">
                                                    <i class="bi bi-lightning-charge-fill text-warning"></i>
                                                    <span class="text-white small fw-bold"><%# Eval("Nombre") %></span>
                                                </div>
                                                <span class="text-info small fw-bolder fs-6">$<%# String.Format("{0:N2}", Eval("Precio")) %></span>
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate></div></FooterTemplate>
                                    </asp:Repeater>
                                </div>

                                <div class="mt-4 pt-3 border-top border-info border-opacity-25 small text-light">
                                    <div class="mb-1"><i class="bi bi-check-circle-fill text-info me-2"></i><strong>El más liviano y veloz de ASP.NET</strong></div>
                                    <div><i class="bi bi-check-circle-fill text-info me-2"></i>Ideal para Cards, Catálogos y diseño moderno</div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- ======================================================== -->
                <!-- PUNTO 5: GRILLA PROPIA CON REPEATER - AKIBA ANIME STORE -->
                <!-- ======================================================== -->
                <div class="tab-pane fade" id="tab-anime" role="tabpanel">

                    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                        <div>
                            <h3 class="fw-bold text-white mb-1"><i class="bi bi-gem text-danger me-2"></i>Akiba Otaku Store</h3>
                            <p class="text-secondary mb-0">Catálogo oficial de figuras, réplicas y coleccionables anime renderizado con <strong>Repeater</strong></p>
                        </div>
                        <span class="badge badge-anime px-3 py-2"><i class="bi bi-check2-circle me-1"></i> Diseñado con Bootstrap 5 Cards</span>
                    </div>

                    <asp:Label ID="lblNotificacionAnime" runat="server" CssClass="alert alert-danger d-block text-center fw-semibold border-0 shadow" Visible="false" style="background: linear-gradient(45deg, #ff4655, #c0392b); color: white;"></asp:Label>

                    <!-- Repeater con Grilla de Cards Anime -->
                    <asp:Repeater ID="rptAnimeStore" runat="server" OnItemCommand="rptAnimeStore_ItemCommand">

                        <HeaderTemplate>
                            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
                        </HeaderTemplate>

                        <ItemTemplate>
                            <div class="col">
                                <div class="anime-card h-100 d-flex flex-column">

                                    <div class="anime-img-container">
                                        <img src='<%# ResolveUrl(Eval("ImagenUrl").ToString()) %>' class="anime-img" alt='<%# Eval("Nombre") %>' />
                                        <span class="position-absolute top-0 start-0 m-3 badge badge-rareza">
                                            <i class="bi bi-stars"></i> <%# Eval("Rareza") %>
                                        </span>
                                    </div>

                                    <div class="card-body p-4 d-flex flex-column flex-grow-1">
                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                            <span class="badge badge-anime"><%# Eval("Serie") %></span>
                                            <span class="price-tag">$<%# String.Format("{0:N2}", Eval("Precio")) %></span>
                                        </div>

                                        <h5 class="card-title text-white fw-bold mb-2"><%# Eval("Nombre") %></h5>
                                        <p class="card-text text-secondary small flex-grow-1"><%# Eval("Descripcion") %></p>

                                        <div class="pt-3 border-top border-secondary mt-auto">
                                            <div class="d-flex justify-content-between text-secondary small mb-3">
                                                <span><i class="bi bi-box-seam me-1"></i> Stock: <strong><%# Eval("Stock") %> unid.</strong></span>
                                                <span class="text-warning"><i class="bi bi-star-fill"></i> 4.9/5</span>
                                            </div>

                                            <asp:Button ID="btnAgregar" runat="server"
                                                Text="Comprar Artículo"
                                                CssClass="btn btn-danger w-100 fw-bold rounded-pill shadow-sm"
                                                style="background: linear-gradient(45deg, #ff4655, #ff7353); border: none;"
                                                CommandName="ComprarAnime"
                                                CommandArgument='<%# Eval("Nombre") + "|" + Eval("Precio") %>' />
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </ItemTemplate>

                        <FooterTemplate>
                            </div>
                        </FooterTemplate>

                    </asp:Repeater>

                </div>

            </div>
        </div>

        <footer class="text-center py-4 text-secondary small border-top border-secondary mt-5">
            Universidad Autónoma del Caribe &bull; Desarrollo en ASP.NET Web Forms &bull; 2026
        </footer>

    </form>

    <!-- Bootstrap 5 Bundle JS para cambiar de pestañas fluidamente -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
