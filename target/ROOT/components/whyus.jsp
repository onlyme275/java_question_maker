<%@ page import="java.util.List" %>
    <%@ page import="com.whyus.model.Whyus" %>
        <% List<Whyus> whyusList = (List<Whyus>) request.getAttribute("whyusList");
                int whyusCount = (whyusList != null) ? whyusList.size() : 0;
                %>

                <style>
                    .whyus-section {
                        background: #ffffff;
                        padding: 80px 24px;
                        font-family: 'Inter', system-ui, -apple-system, sans-serif;
                    }

                    .whyus-container {
                        max-width: 1140px;
                        margin: 0 auto;
                    }

                    .whyus-header {
                        text-align: center;
                        max-width: 600px;
                        margin: 0 auto 50px auto;
                    }

                    .whyus-header span {
                        font-size: 13px;
                        font-weight: 600;
                        text-transform: uppercase;
                        letter-spacing: 0.1em;
                        color: #2563eb;
                        margin-bottom: 8px;
                        display: inline-block;
                    }

                    .whyus-header h2 {
                        font-size: 32px;
                        font-weight: 700;
                        color: #0f172a;
                        line-height: 1.25;
                        margin: 0 0 16px 0;
                        letter-spacing: -0.02em;
                    }

                    .whyus-header p {
                        font-size: 16px;
                        color: #64748b;
                        line-height: 1.6;
                        margin: 0;
                    }

                    .whyus-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                        gap: 30px;
                    }

                    .whyus-card {
                        background: #ffffff;
                        border: 1px solid #e2e8f0;
                        border-radius: 16px;
                        overflow: hidden;
                        transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1), box-shadow 0.3s ease;
                        display: flex;
                        flex-direction: column;
                    }

                    .whyus-card:hover {
                        transform: translateY(-8px);
                        box-shadow: 0 20px 25px -5px rgb(0 0 0 / 0.05), 0 8px 10px -6px rgb(0 0 0 / 0.05);
                        border-color: #cbd5e1;
                    }

                    .whyus-card-img {
                        height: 200px;
                        overflow: hidden;
                        position: relative;
                    }

                    .whyus-card-img img {
                        width: 100%;
                        height: 100%;
                        object-fit: cover;
                        transition: transform 0.5s ease;
                    }

                    .whyus-card:hover .whyus-card-img img {
                        transform: scale(1.05);
                    }

                    .whyus-card-body {
                        padding: 24px;
                        flex: 1;
                        display: flex;
                        flex-direction: column;
                    }

                    .whyus-card-body h3 {
                        font-size: 18px;
                        font-weight: 600;
                        color: #0f172a;
                        margin: 0 0 12px 0;
                        line-height: 1.4;
                    }

                    .whyus-card-body p {
                        font-size: 14px;
                        color: #475569;
                        line-height: 1.6;
                        margin: 0;
                        flex: 1;
                    }

                    /* Empty state */
                    .whyus-empty {
                        text-align: center;
                        padding: 60px 20px;
                        background: #f8fafc;
                        border-radius: 16px;
                        border: 2px dashed #e2e8f0;
                        color: #94a3b8;
                    }

                    .whyus-empty i {
                        font-size: 40px;
                        margin-bottom: 16px;
                        color: #cbd5e1;
                    }

                    .whyus-empty p {
                        font-size: 15px;
                        margin: 0;
                    }

                    @media (max-width: 640px) {
                        .whyus-section {
                            padding: 50px 16px;
                        }

                        .whyus-header h2 {
                            font-size: 26px;
                        }
                    }
                </style>

                <section class="whyus-section">
                    <div class="whyus-container">

                        <div class="whyus-header">
                            <span>Our Strengths</span>
                            <h2>Why Choose Us?</h2>
                            <p>Discover the values, qualities, and features that make us stand out from the rest and
                                deliver exceptional results.</p>
                        </div>

                        <% if (whyusList !=null && !whyusList.isEmpty()) { %>
                            <div class="whyus-grid">
                                <% for (Whyus w : whyusList) { %>
                                    <div class="whyus-card">
                                        <div class="whyus-card-img">
                                            <img src="<%= request.getContextPath() %>/<%= w.getImage() %>"
                                                alt="<%= w.getTitle() %>">
                                        </div>
                                        <div class="whyus-card-body">
                                            <h3>
                                                <%= w.getTitle() %>
                                            </h3>
                                            <p>
                                                <%= w.getDescription() %>
                                            </p>
                                        </div>
                                    </div>
                                    <% } %>
                            </div>
                            <% } else { %>
                                <div class="whyus-empty">
                                    <i class="fa-solid fa-circle-question"></i>
                                    <p>No feature showcase items are currently set. Admins can add items from the
                                        dashboard.</p>
                                </div>
                                <% } %>

                    </div>
                </section>