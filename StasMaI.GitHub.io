html
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Фишинг для студентов</title>
    <style>
        /* Основные стили */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        :root {
            --primary-blue: #1e3c72;
            --secondary-blue: #2a5298;
            --accent-orange: #ff9800;
            --success-green: #4caf50;
            --warning-red: #f44336;
            --light-bg: #f5f5f5;
            --dark-bg: #121212;
            --text-light: #333;
            --text-dark: #f5f5f5;
        }
        
        body {
            font-family: 'Arial', 'Segoe UI', sans-serif;
            line-height: 1.6;
            color: var(--text-light);
            background-color: var(--light-bg);
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
            transition: background-color 0.3s, color 0.3s;
        }
        
        body.dark-theme {
            background-color: var(--dark-bg);
            color: var(--text-dark);
        }
        
        /* Шапка */
        header {
            background: linear-gradient(to right, var(--primary-blue), var(--secondary-blue));
            color: white;
            padding: 30px;
            border-radius: 10px;
            margin-bottom: 30px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            position: relative;
        }
        
        .theme-toggle {
            position: absolute;
            top: 20px;
            right: 20px;
            background: rgba(255,255,255,0.2);
            border: none;
            color: white;
            padding: 8px 15px;
            border-radius: 20px;
            cursor: pointer;
            font-size: 0.9em;
            transition: background 0.3s;
        }
        
        .theme-toggle:hover {
            background: rgba(255,255,255,0.3);
        }
        
        h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        
        .subtitle {
            font-size: 1.2em;
            opacity: 0.9;
        }
        
        .student-badge {
            background-color: var(--accent-orange);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            display: inline-block;
            margin-top: 10px;
            font-weight: bold;
        }
        
        /* Навигация */
        nav {
            background-color: white;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            position: sticky;
            top: 20px;
            z-index: 100;
        }
        
        body.dark-theme nav {
            background-color: #1e1e1e;
        }
        
        nav ul {
            display: flex;
            list-style: none;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }
        
        nav a {
            color: var(--secondary-blue);
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 5px;
            transition: all 0.3s;
            position: relative;
        }
        
        body.dark-theme nav a {
            color: #4fc3f7;
        }
        
        nav a:hover, nav a.active {
            background-color: #e8f0fe;
            font-weight: bold;
        }
        
        body.dark-theme nav a:hover,
        body.dark-theme nav a.active {
            background-color: #2a3b5a;
        }
        
        nav a.active:after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 15px;
            right: 15px;
            height: 3px;
            background-color: var(--accent-orange);
            border-radius: 3px;
        }
        
        /* Прогресс-бар */
        .progress-container {
            width: 100%;
            height: 5px;
            background: #e0e0e0;
            border-radius: 5px;
            margin-top: 10px;
            overflow: hidden;
        }
        
        .progress-bar {
            height: 100%;
            background: linear-gradient(to right, var(--accent-orange), #ff5722);
            width: 0%;
            transition: width 0.3s;
        }
        
        /* Основное содержание */
        section {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            scroll-margin-top: 100px;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s, transform 0.5s;
        }
        
        body.dark-theme section {
            background-color: #1e1e1e;
        }
        
        section.visible {
            opacity: 1;
            transform: translateY(0);
        }
        
        h2 {
            color: var(--primary-blue);
            border-bottom: 3px solid var(--accent-orange);
            padding-bottom: 10px;
            margin-bottom: 20px;
            font-size: 1.8em;
        }
        
        body.dark-theme h2 {
            color: #4fc3f7;
        }
        
        h3 {
            color: var(--secondary-blue);
            margin: 20px 0 10px;
            font-size: 1.4em;
        }
        
        body.dark-theme h3 {
            color: #81d4fa;
        }
        
        p {
            margin-bottom: 15px;
            font-size: 1.1em;
        }
        
        /* Блоки с информацией */
        .info-box, .warning-box, .tip-box {
            padding: 20px;
            margin: 20px 0;
            border-radius: 0 8px 8px 0;
            transition: transform 0.3s;
        }
        
        .info-box:hover, .warning-box:hover, .tip-box:hover {
            transform: translateX(5px);
        }
        
        .info-box {
            background-color: #e8f0fe;
            border-left: 5px solid var(--secondary-blue);
        }
        
        body.dark-theme .info-box {
            background-color: #1a237e;
        }
        
        .warning-box {
            background-color: #ffebee;
            border-left: 5px solid var(--warning-red);
        }
        
        body.dark-theme .warning-box {
            background-color: #311b92;
        }
        
        .tip-box {
            background-color: #f1f8e9;
            border-left: 5px solid var(--success-green);
        }
        
        body.dark-theme .tip-box {
            background-color: #1b5e20;
        }
        
        /* Классификация */
        .phishing-types {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        
        .type {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            border: 2px solid #e0e0e0;
            transition: all 0.3s;
            cursor: pointer;
        }
        
        body.dark-theme .type {
            background-color: #252525;
            border-color: #444;
        }
        
        .type:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .type h4 {
            color: var(--primary-blue);
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .type h4:before {
            content: '⚠️';
            font-size: 1.2em;
        }
        
        /* Примеры фишинга */
        .examples-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin: 20px 0;
        }
        
        .example {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 3px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        
        body.dark-theme .example {
            background-color: #252525;
        }
        
        .example:hover {
            transform: scale(1.03);
        }
        
        .example-img {
            height: 150px;
            background: linear-gradient(45deg, #ff6b6b, #ffa726);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2em;
        }
        
        .example-content {
            padding: 15px;
        }
        
        .example-content h4 {
            margin-bottom: 10px;
            color: var(--primary-blue);
        }
        
        /* Случаи атак */
        .case {
            background-color: #fff8e1;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
            border: 2px dashed var(--accent-orange);
            position: relative;
            overflow: hidden;
        }
        
        body.dark-theme .case {
            background-color: #332900;
        }
        
        .case:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: linear-gradient(to right, var(--accent-orange), #ff5722);
        }
        
        .case h4 {
            color: var(--accent-orange);
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        
        .year {
            background-color: var(--accent-orange);
            color: white;
            padding: 3px 10px;
            border-radius: 15px;
            font-size: 0.9em;
            margin-left: 10px;
        }
        
        /* Методы защиты */
        .protection-list {
            list-style: none;
        }
        
        .protection-list li {
            background-color: #f9f9f9;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 8px;
            border-left: 5px solid var(--success-green);
            position: relative;
            padding-left: 40px;
            transition: transform 0.3s;
        }
        
        body.dark-theme .protection-list li {
            background-color: #252525;
        }
        
        .protection-list li:hover {
            transform: translateX(5px);
        }
        
        .protection-list li:before {
            content: "✓";
            position: absolute;
            left: 15px;
            top: 15px;
            color: var(--success-green);
            font-weight: bold;
            font-size: 1.2em;
        }
        
        /* Статистика */
        .stats {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
            margin: 20px 0;
        }
        
        .stat {
            background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
            color: white;
            padding: 25px;
            border-radius: 8px;
            text-align: center;
            min-width: 200px;
            flex: 1;
            transition: transform 0.3s;
        }
        
        .stat:hover {
            transform: scale(1.05);
        }
        
        .stat-number {
            font-size: 2.5em;
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
        }
        
        /* Научные источники */
        .source {
            font-size: 0.9em;
            color: #666;
            margin-top: 10px;
            padding-left: 15px;
            border-left: 3px solid #ccc;
        }
        
        body.dark-theme .source {
            color: #aaa;
        }
        
        .source a {
            color: var(--primary-blue);
            text-decoration: none;
        }
        
        body.dark-theme .source a {
            color: #4fc3f7;
        }
        
        .source a:hover {
            text-decoration: underline;
        }
        
        /* Подвал */
        footer {
            background: linear-gradient(to right, #333, #444);
            color: white;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            margin-top: 30px;
        }
        
        body.dark-theme footer {
            background: linear-gradient(to right, #1a1a1a, #2a2a2a);
        }
        
        .resources {
            margin-top: 20px;
        }
        
        .resources a {
            color: #4fc3f7;
            text-decoration: none;
            margin: 0 10px;
        }
        
        .resources a:hover {
            text-decoration: underline;
        }
        
        /* Кнопки */
        .btn {
            display: inline-block;
            background: var(--accent-orange);
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-size: 1em;
            transition: background 0.3s;
            margin: 10px 5px;
        }
        
        .btn:hover {
            background: #e68900;
        }
        
        /* Для мобильных */
        @media (max-width: 768px) {
            nav ul {
                flex-direction: column;
                align-items: center;
            }
            
            .phishing-types, .examples-grid {
                grid-template-columns: 1fr;
            }
            
            .stats {
                flex-direction: column;
                align-items: center;
            }
            
            h1 {
                font-size: 2em;
            }
            
            .stat {
                min-width: 100%;
            }
            
            .case h4 {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .year {
                margin-left: 0;
                margin-top: 5px;
            }
            
            .theme-toggle {
                position: relative;
                top: 0;
                right: 0;
                margin-top: 15px;
            }
        }
        
        /* Анимации */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
        
        .highlight {
            animation: pulse 2s infinite;
        }
    </style>
</head>
<body>
    <!-- Шапка -->
    <header>
        <button class="theme-toggle" id="themeToggle">🌙 Темная тема</button>
        <h1>Фишинг: похищение личной информации пользователей</h1>
        <p class="subtitle">Интерактивное руководство по безопасности</p>
        <div class="student-badge">Для широкой аудитории</div>
    </header>
    
    <!-- Навигация -->
    <nav>
        <ul>
            <li><a href="#what-is" class="active">Что такое фишинг</a></li>
            <li><a href="#types">Виды фишинга</a></li>
            <li><a href="#examples">Примеры</a></li>
            <li><a href="#opensource">Open Source</a></li>
            <li><a href="#cases">Случаи атак</a></li>
            <li><a href="#protection">Защита</a></li>
            <li><a href="#quiz">Тест</a></li>
        </ul>
        <div class="progress-container">
            <div class="progress-bar" id="progressBar"></div>
        </div>
    </nav>
    
    <!-- Основное содержание -->
    <main>
        <!-- Понятие фишинга -->
        <section id="what-is">
            <h2>Что такое фишинг? <span class="highlight">⚠️</span></h2>
            <p><strong>Фишинг</strong> - это вид интернет-мошенничества, когда злоумышленники притворяются надежными организациями, чтобы украсть ваши личные данные: пароли, номера карт, логины.</p>
            
            <div class="info-box">
                <h3>Простыми словами:</h3>
                <p>Представьте: "Вам пришло сообщение от банка "Ваш счёт заблокирован!" Вы в панике, не знаете что делать. Мошенники сначала пугают жертву, а затем предлагают "спасительное" решение — "перевести деньги на безопасный счёт".</p>
            </div>
            
            <div class="stats">
                <div class="stat">
                    <span class="stat-number">91%</span>
                    всех кибератак начинаются с фишинга
                </div>
                <div class="stat">
                    <span class="stat-number">75%</span>
                    организаций сталкивались с фишингом
                </div>
                <div class="stat">
                    <span class="stat-number">3.4 млрд</span>
                    фишинговых писем в день
                </div>
            </div>
            
            <p class="source">
                Источник: Verizon. (2022). Data Breach Investigations Report. 
                <a href="https://www.verizon.com/business/resources/reports/dbir/" target="_blank" rel="noopener noreferrer">Подробнее</a>
            </p>
        </section>
        
        <!-- Виды фишинга -->
        <section id="types">
            <h2>Классификация фишинга</h2>
            <p>Существует несколько основных типов фишинговых атак:</p>
            
            <div class="phishing-types">
                <div class="type" onclick="showTypeInfo('mass')">
                    <h4>1. Массовый фишинг</h4>
                    <p>Рассылка тысяч одинаковых писем разным людям. Как спам, но опасный.</p>
                    <p class="source">Самый распространенный тип</p>
                </div>
                
                <div class="type" onclick="showTypeInfo('targeted')">
                    <h4>2. Целевой фишинг</h4>
                    <p>Атака на конкретного человека. Письмо содержит личные данные жертвы.</p>
                    <p class="source">Опаснее массового</p>
                </div>
                
                <div class="type" onclick="showTypeInfo('social')">
                    <h4>3. Фишинг в соцсетях</h4>
                    <p>Мошенники пишут в соцсетях от имени друзей или известных брендов.</p>
                    <p class="source">Популярен среди студентов</p>
                </div>
                
                <div class="type" onclick="showTypeInfo('smishing')">
                    <h4>4. Смишинг</h4>
                    <p>Фишинг через SMS. "Ваша посылка ждет, перейдите по ссылке"</p>
                    <p class="source">Растет с 2020 года</p>
                </div>
                
                <div class="type" onclick="showTypeInfo('vishing')">
                    <h4>5. Вишинг</h4>
                    <p>Звонок от "службы безопасности банка". Просят назвать данные карты.</p>
                    <p class="source">Сложно распознать</p>
                </div>
                
                <div class="type" onclick="showTypeInfo('clone')">
                    <h4>6. Клон-фишинг</h4>
                    <p>Создание копии настоящего письма, но с вредоносной ссылкой.</p>
                    <p class="source">Очень хитрая тактика</p>
                </div>
            </div>
            
            <div id="typeInfo" style="display:none; margin-top:20px; padding:20px; background:#e8f0fe; border-radius:8px;">
                <h3 id="typeTitle"></h3>
                <p id="typeDescription"></p>
                <button class="btn" onclick="hideTypeInfo()">Закрыть</button>
            </div>
            
            <p class="source">
                На основе классификации APWG (Anti-Phishing Working Group)
            </p>
        </section>
        
        <!-- Примеры фишинга -->
        <section id="examples">
            <h2>Примеры фишинговых атак</h2>
            <p>Визуальные примеры того, как выглядят фишинговые сообщения:</p>
            
            <div class="examples-grid">
                <div class="example">
                    <div class="example-img">📧</div>
                    <div class="example-content">
                        <h4>Фальшивое письмо от банка</h4>
                        <p>"Уважаемый клиент! Ваша карта заблокирована. Для разблокировки перейдите по ссылке..."</p>
                    </div>
                </div>
                
                <div class="example">
                    <div class="example-img">📱</div>
                    <div class="example-content">
                        <h4>SMS-фишинг</h4>
                        <p>"Ваша посылка не может быть доставлена. Подтвердите адрес: example-phish.ru"</p>
                    </div>
                </div>
                
                <div class="example">
                    <div class="example-img">👥</div>
                    <div class="example-content">
                        <h4>Социальные сети</h4>
                        <p>"Привет! Посмотри это смешное видео про тебя: malicious-link.com"</p>
                    </div>
                </div>
                
                <div class="example">
                    <div class="example-img">🎣</div>
                    <div class="example-content">
                        <h4>Фейковый сайт</h4>
                        <p>Копия страницы входа в соцсеть или банк для кражи паролей</p>
                    </div>
                </div>
            </div>
            
            <div class="tip-box">
                <p><strong>Как распознать:</strong> Проверяйте URL-адрес, смотрите на качество письма, никогда не переходите по подозрительным ссылкам!</p>
            </div>
        </section>
        
        <!-- Open Source -->
        <section id="opensource">
            <h2>Фишинг и Open Source</h2>
            <p>Open Source (открытое программное обеспечение) - это программы с открытым исходным кодом. Примеры: Linux, WordPress, библиотеки для программирования.</p>
            
            <div class="warning-box">
                <h3>Почему Open Source уязвим?</h3>
                <p>1. <strong>Разработчики-добровольцы</strong> - часто нет строгой проверки безопасности</p>
                <p>2. <strong>Цепочка зависимостей</strong> - одна библиотека используется в тысячах программ</p>
                <p>3. <strong>Открытый доступ</strong> - злоумышленники могут изучать код на уязвимости</p>
            </div>
            
            <h3>Как атакуют Open Source через фишинг:</h3>
            <p>1. Воруют пароли разработчиков популярных библиотек</p>
            <p>2. Добавляют вредоносный код в обновления</p>
            <p>3. Этот код попадает во все программы, которые используют библиотеку</p>
            
            <div class="tip-box">
                <p><strong>Пример:</strong> В 2021 году через фишинг взломали аккаунт разработчика библиотеки UA-Parser-JS. Вредоносный код попал в программы с 7+ млн загрузок в неделю!</p>
            </div>
            
            <p class="source">
                Источник: Ladisa, P. (2023). Systematic Review of Software Supply Chain Attacks
            </p>
        </section>
        
        <!-- Примеры атак -->
        <section id="cases">
            <h2>Масштабные случаи атак</h2>
            
            <div class="case">
                <h4>Атака на SolarWinds <span class="year">2020</span></h4>
                <p><strong>Суть проблемы:</strong> Через фишинг взломали компанию SolarWinds. В их программу добавили "заднюю дверь".</p>
                <p><strong>Масштаб:</strong> Пострадали 18,000 организаций, включая правительство США</p>
                <p><strong>Вывод:</strong> Крупные компании тоже уязвимы</p>
            </div>
            
            <div class="case">
                <h4>Взлом npm (библиотеки для JavaScript) <span class="year">2022</span></h4>
                <p><strong>Суть проблемы:</strong> Фишинговая атака на разработчиков. Украли пароли и опубликовали вредоносные версии библиотек.</p>
                <p><strong>Масштаб:</strong> 400+ вредоносных пакетов</p>
                <p><strong>Вывод:</strong> Даже опытные программисты попадаются на уловки фишинга.</p>
            </div>
            
            <div class="case">
                <h4>Фейковый репозиторий на GitHub <span class="year">2021</span></h4>
                <p><strong>Что случилось:</strong> Создали копию популярного репозитория с вредоносным кодом.</p>
                <p><strong>Масштаб:</strong> Тысячи разработчиков случайно скопировали вредоносный код</p>
                <p><strong>Вывод:</strong> Необходимо всегда проверять источники кода.</p>
            </div>
        </section>
        
        <!-- Защита -->
        <section id="protection">
            <h2>Методы защиты от фишинга</h2>
            
            <h3>Простые правила для студентов:</h3>
            <ul class="protection-list">
                <li><strong>Проверяйте адрес отправителя</strong> - мошенники используют похожие адреса (my.mai.ru > my.mal.ru)</li>
                <li><strong>Не переходите по подозрительным ссылкам</strong> - лучше ввести адрес сайта вручную</li>
                <li><strong>Включите двухфакторную аутентификацию</strong> - даже если украдут пароль, не войдут</li>
                <li><strong>Обновляйте программы</strong> - в обновлениях часто исправляют уязвимости</li>
                <li><strong>Используйте менеджер паролей</strong> - он не заполнит данные на поддельном сайте</li>
                <li><strong>Не открывайте подозрительные вложения</strong> - особенно .exe, .zip файлы</li>
            </ul>
            
            <h3>Для разработчиков Open Source:</h3>
            <div class="tip-box">
                <p>1. Используйте двухфакторную аутентификацию на GitHub</p>
                <p>2. Подписывайте коммиты (git commit -S)</p>
                <p>3. Проверяйте зависимости перед использованием</p>
                <p>4. Используйте инструменты анализа безопасности кода</p>
            </div>
            
            <p class="source">
                Рекомендации основаны на исследованиях Kumar, A. (2022) и OpenSSF
            </p>
        </section>
       
            <div class="info-box">
                <p><strong>Помните:</strong> Банки никогда не просят подтвердить данные карты по email или SMS!</p>
            </div>
        </section>
    </main>
    
    <!-- Подвал -->
    <footer>
        <p>© 2025 Материал по фишингу составил Алипов С.А.</p>
        <p>Материал выбран на основе научных исследований и отчетов по кибербезопасности</p>
        
        <div class="resources">
            <p><strong>Полезные ресурсы для изучения:</strong></p>
            <p>
                <a href="https://www.verizon.com/business/resources/reports/dbir/" target="_blank" rel="noopener noreferrer">Отчет Verizon</a> |
                <a href="https://openssf.org/" target="_blank" rel="noopener noreferrer">Open Source Security Foundation</a> |
                <a href="https://www.cisa.gov/stopransomware/phishing" target="_blank" rel="noopener noreferrer">CISA: Фишинг</a>
            </p>
        </div>
        
        <p style="margin-top: 20px; font-size: 0.9em;">
            Материал подготовлен для студентов технических вузов и прочей аудитории.<br>
            Все примеры и статистика взяты из проверенных научных источников.
        </p>
        
        <button class="btn" onclick="window.scrollTo({top: 0, behavior: 'smooth'})">Наверх ↑</button>
    </footer>

    <script>
        // Переменные для управления состоянием
        let currentAnswer = null;
        let answerCorrectness = null;

        // Переключение темы
        const themeToggle = document.getElementById('themeToggle');
        themeToggle.addEventListener('click', () => {
            document.body.classList.toggle('dark-theme');
            themeToggle.textContent = document.body.classList.contains('dark-theme') 
                ? '☀️ Светлая тема' 
                : '🌙 Темная тема';
        });

        // Плавная прокрутка и активная навигация
        document.querySelectorAll('nav a').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                
                const targetId = this.getAttribute('href');
                const targetElement = document.querySelector(targetId);
                
                // Обновляем активную ссылку
                document.querySelectorAll('nav a').forEach(link => {
                    link.classList.remove('active');
                });
                this.classList.add('active');
                
                // Прокрутка
                window.scrollTo({
                    top: targetElement.offsetTop - 100,
                    behavior: 'smooth'
                });
                
                // Показываем секцию с анимацией
                targetElement.classList.add('visible');
            });
        });

        // Прогресс-бар
        function updateProgressBar() {
            const sections = document.querySelectorAll('section');
            const scrollPosition = window.scrollY;
            const windowHeight = window.innerHeight;
            const documentHeight = document.documentElement.scrollHeight;
            
            let currentSection = 0;
            sections.forEach(section => {
                if (scrollPosition >= section.offsetTop - 150) {
                    currentSection++;
                }
            });
            
            const progress = (currentSection / sections.length) * 100;
            document.getElementById('progressBar').style.width = progress + '%';
        }

        window.addEventListener('scroll', updateProgressBar);
        window.addEventListener('resize', updateProgressBar);

        // Анимация появления секций
        function checkVisibility() {
            const sections = document.querySelectorAll('section');
            const windowHeight = window.innerHeight;
            
            sections.forEach(section => {
                const sectionTop = section.getBoundingClientRect().top;
                if (sectionTop < windowHeight - 100) {
                    section.classList.add('visible');
                }
            });
        }

        window.addEventListener('scroll', checkVisibility);
        window.addEventListener('load', checkVisibility);

        // Информация о типах фишинга
        const typeInfo = {
            mass: {
                title: "Массовый фишинг",
                description: "Наиболее распространенный тип фишинга. Мошенники рассылают тысячи одинаковых писем случайным людям, надеясь, что кто-то 'клюнет'. Часто используют страшные темы: блокировка аккаунта, проблемы с доставкой, налоговые вопросы."
            },
            targeted: {
                title: "Целевой фишинг (Spear Phishing)",
                description: "Атака направлена на конкретного человека или организацию. Мошенники собирают информацию о жертве из соцсетей и других источников, чтобы письмо выглядело максимально правдоподобно. Особо опасен для сотрудников с доступом к важной информации."
            },
            social: {
                title: "Фишинг в социальных сетях",
                description: "Использует доверительные отношения в соцсетях. Мошенники создают фейковые аккаунты или взламывают существующие, чтобы рассылать вредоносные ссылки от имени 'друзей'. Часто маскируются под интересные видео, опросы или приложения."
            },
            smishing: {
                title: "Смишинг (SMS-фишинг)",
                description: "Фишинг через SMS-сообщения. Особенно опасен, так как люди больше доверяют SMS, чем email. Частые темы: 'посылка не может быть доставлена', 'проблемы с банковским счетом', 'выигрыш в лотерее'. Всегда содержит ссылку для 'решения проблемы'."
            },
            vishing: {
                title: "Вишинг (голосовой фишинг)",
                description: "Фишинг по телефону. Мошенники звонят от имени банка, службы поддержки или государственных органов. Используют психологические приемы: создают срочность, пугают последствиями, предлагают 'простое решение'. Никогда не называйте данные карты по телефону!"
            },
            clone: {
                title: "Клон-фишинг",
                description: "Мошенники создают точную копию настоящего письма, которое вы получали ранее, но заменяют ссылки или вложения на вредоносные. Особенно опасно, так как выглядит как легитимное письмо от знакомого отправителя."
            }
        };

        function showTypeInfo(type) {
            const infoDiv = document.getElementById('typeInfo');
            document.getElementById('typeTitle').textContent = typeInfo[type].title;
            document.getElementById('typeDescription').textContent = typeInfo[type].description;
            infoDiv.style.display = 'block';
            infoDiv.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
        }

        function hideTypeInfo() {
            document.getElementById('typeInfo').style.display = 'none';
        }

        // Анимация статистики при загрузке
        function animateStats() {
            const stats = document.querySelectorAll('.stat-number');
            stats.forEach(stat => {
                const originalText = stat.textContent;
                const isPercentage = originalText.includes('%');
                const isBillion = originalText.includes('млрд');
                let targetValue;
                
                if (isPercentage) {
                    targetValue = parseInt(originalText);
                } else if (isBillion) {
                    targetValue = parseFloat(originalText) * 1000;
                }
                
                let currentValue = 0;
                const increment = isBillion ? 50 : 1;
                const speed = isBillion ? 20 : 30;
                
                const timer = setInterval(() => {
                    currentValue += increment;
                    if (isPercentage) {
                        stat.textContent = currentValue + '%';
                    } else if (isBillion) {
                        stat.textContent = (currentValue / 1000).toFixed(1) + ' млрд';
                    }
                    
                    if (currentValue >= targetValue) {
                        stat.textContent = originalText;
                        clearInterval(timer);
                    }
                }, speed);
            });
        }

        // Инициализация при загрузке
        document.addEventListener('DOMContentLoaded', () => {
            animateStats();
            checkVisibility();
            updateProgressBar();
            
            // Устанавливаем первую ссылку как активную
            document.querySelector('nav a').classList.add('active');
        });

        // Обработка нажатий на типы фишинга
        document.querySelectorAll('.type').forEach(type => {
            type.addEventListener('click', function() {
                this.style.animation = 'pulse 0.5s';
                setTimeout(() => {
                    this.style.animation = '';
                }, 500);
            });
        });
    </script>
</body>

</html>
