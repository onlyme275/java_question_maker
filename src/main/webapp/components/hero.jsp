<%@ page import="java.util.List" %>
<%@ page import="com.hero.model.Hero" %>
<%
    List<Hero> heroes = (List<Hero>) request.getAttribute("heroes");
    int total = (heroes != null) ? heroes.size() : 0;
    
    // Debug output
    if (heroes != null) {
        for (Hero h : heroes) {
            System.out.println("Hero: " + h.getTitle() + " | Image: " + h.getImage());
        }
    } else {
        System.out.println("HEROES ATTRIBUTE IS NULL");
    }
%>

<style>
.hero-wrapper {
    background: #f8fafc;
    padding: 60px 24px;
}

.hero-track-outer {
    max-width: 960px;
    margin: 0 auto;
    position: relative;
}

.hero-track {
    overflow: hidden;
    border-radius: 20px;
    border: 1px solid #e8eaf0;
}

.hero-slides {
    display: flex;
    transition: transform 0.45s cubic-bezier(0.4, 0, 0.2, 1);
}

/* ── Each slide ── */
.hero-card {
    min-width: 100%;
    display: grid;
    grid-template-columns: 1fr 1fr;
    min-height: 480px;
    background: #ffffff;
}

.hero-card.layout-reverse {
    direction: rtl;
}
.hero-card.layout-reverse > * {
    direction: ltr;
}

.hero-img {
    overflow: hidden;
}
.hero-img img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
    transition: transform 0.4s ease;
}
.hero-card:hover .hero-img img {
    transform: scale(1.03);
}

.hero-content {
    padding: 52px 48px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 20px;
}

.hero-eyebrow {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 12px;
    font-weight: 600;
    letter-spacing: 0.08em;
    text-transform: uppercase;
    color: #2563eb;
}
.hero-eyebrow::before {
    content: '';
    display: block;
    width: 20px;
    height: 2px;
    background: currentColor;
    border-radius: 1px;
}

.hero-content h1 {
    font-size: 36px;
    font-weight: 600;
    line-height: 1.2;
    color: #0f172a;
    letter-spacing: -0.02em;
    margin: 0;
}

.hero-content p {
    font-size: 15px;
    color: #475569;
    line-height: 1.75;
    margin: 0;
}

.hero-cta {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    margin-top: 8px;
    padding: 13px 26px;
    background: #0f172a;
    color: #ffffff;
    border-radius: 10px;
    font-size: 14px;
    font-weight: 500;
    text-decoration: none;
    width: fit-content;
    transition: opacity 0.15s;
}
.hero-cta:hover { opacity: 0.85; }
.hero-cta svg { width: 16px; height: 16px; }

/* ── Nav buttons ── */
.hero-nav-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 48px;
    height: 48px;
    border-radius: 50%;
    background: #ffffff;
    border: 1px solid #e2e8f0;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    z-index: 10;
    transition: border-color 0.2s, background 0.2s;
    box-shadow: none;
}
.hero-nav-btn:hover {
    border-color: #94a3b8;
    background: #f8fafc;
}
.hero-nav-btn:active {
    transform: translateY(-50%) scale(0.95);
}
.hero-nav-btn svg {
    width: 20px;
    height: 20px;
    stroke: #334155;
    stroke-width: 2;
    fill: none;
    stroke-linecap: round;
    stroke-linejoin: round;
}
.hero-nav-prev { left: -24px; }
.hero-nav-next { right: -24px; }

/* ── Dots + counter ── */
.hero-dots {
    display: flex;
    justify-content: center;
    gap: 8px;
    margin-top: 20px;
}
.hero-dot {
    width: 7px;
    height: 7px;
    border-radius: 50%;
    background: #cbd5e1;
    border: none;
    cursor: pointer;
    padding: 0;
    transition: background 0.2s, transform 0.2s;
}
.hero-dot.active {
    background: #0f172a;
    transform: scale(1.3);
}
.hero-counter {
    text-align: center;
    font-size: 12px;
    color: #94a3b8;
    margin-top: 10px;
    letter-spacing: 0.04em;
}

/* ── Empty state ── */
.hero-empty {
    max-width: 960px;
    margin: 0 auto;
    padding: 80px 24px;
    text-align: center;
    background: #f1f5f9;
    border-radius: 20px;
    border: 1.5px dashed #cbd5e1;
    color: #94a3b8;
    font-size: 15px;
}

/* ── Mobile ── */
@media (max-width: 768px) {
    .hero-card {
        grid-template-columns: 1fr;
        min-height: unset;
    }
    .hero-card.layout-reverse { direction: ltr; }
    .hero-img { height: 240px; }
    .hero-content { padding: 32px 24px; }
    .hero-content h1 { font-size: 24px; }
    .hero-nav-btn { width: 38px; height: 38px; }
    .hero-nav-prev { left: -12px; }
    .hero-nav-next { right: -12px; }
}
</style>

<div class="hero-wrapper">
<%
    if (heroes != null && !heroes.isEmpty()) {
%>
    <div class="hero-track-outer">

        <!-- Prev button -->
        <button class="hero-nav-btn hero-nav-prev" onclick="heroSlide(-1)" aria-label="Previous slide">
            <svg viewBox="0 0 24 24"><polyline points="15 18 9 12 15 6"/></svg>
        </button>

        <!-- Slides -->
        <div class="hero-track">
            <div class="hero-slides" id="heroSlides">
<%
        int index = 0;
        for (Hero h : heroes) {
            String reverseClass = (index % 2 != 0) ? " layout-reverse" : "";
%>
                <div class="hero-card<%= reverseClass %>">
                    <div class="hero-img">
                        <%
                            String imgSrc = request.getContextPath() + "/" + h.getImage();
                            System.out.println("Debug: Image URL = " + imgSrc);
                        %>
                        <img src="<%= imgSrc %>"
                             alt="<%= h.getTitle() %>">
                    </div>
                    <div class="hero-content">
                        <span class="hero-eyebrow">Featured</span>
                        <h1><%= h.getTitle() %></h1>
                        <p><%= h.getDescription() %></p>
                        <a href="#" class="hero-cta">
                            Learn more
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M5 12h14M12 5l7 7-7 7"/>
                            </svg>
                        </a>
                    </div>
                </div>
<%
            index++;
        }
%>
            </div>
        </div>

        <!-- Next button -->
        <button class="hero-nav-btn hero-nav-next" onclick="heroSlide(1)" aria-label="Next slide">
            <svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"/></svg>
        </button>
    </div>

    <!-- Dots -->
    <div class="hero-dots" id="heroDots"></div>
    <div class="hero-counter" id="heroCounter">1 / <%= total %></div>

    <script>
    (function () {
        var cur = 0;
        var total = <%= total %>;
        var slidesEl = document.getElementById('heroSlides');
        var dotsEl   = document.getElementById('heroDots');
        var ctrEl    = document.getElementById('heroCounter');

        for (var i = 0; i < total; i++) {
            (function(idx) {
                var d = document.createElement('button');
                d.className = 'hero-dot' + (idx === 0 ? ' active' : '');
                d.setAttribute('aria-label', 'Go to slide ' + (idx + 1));
                d.onclick = function () { heroGoTo(idx); };
                dotsEl.appendChild(d);
            })(i);
        }

        window.heroGoTo = function (n) {
            cur = (n + total) % total;
            slidesEl.style.transform = 'translateX(-' + (cur * 100) + '%)';
            var dots = dotsEl.querySelectorAll('.hero-dot');
            dots.forEach(function (d, i) {
                d.classList.toggle('active', i === cur);
            });
            ctrEl.textContent = (cur + 1) + ' / ' + total;
        };

        window.heroSlide = function (dir) {
            heroGoTo(cur + dir);
        };
    })();
    </script>

<%
    } else {
%>
    <div class="hero-empty">
        No hero content available.
    </div>
<%
    }
%>
</div>