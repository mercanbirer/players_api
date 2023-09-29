## go_router

go_router, Flutter uygulamalarında gezinme (routing) işlemlerini kolayca yönetmek için kullanılan bir pakettir. Bu paket, Flutter uygulamalarının sayfa geçişlerini ve gezinme mantığını daha verimli bir şekilde yönetmeye yardımcı olur.

## Get started

- Başlamak için pubspec.yaml dosyasına go_router'ı ekliyoruz.

   ```
   dependencies:
     go_router: ^7.1.1
   ```

- Uygulamaya GoRouter yapılandırmasını ekliyoruz:
    ```
    final router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
        name: 'playerScreen',
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const PlayerScreen(),
        routes: <GoRoute>[
          GoRoute(
            name: 'playerDetailScreen',
            path: 'playerDetailScreen',
            builder: (BuildContext context, GoRouterState state) {
              Player player = state.extra as Player;
              return PlayerDetailsScreen(player: player);
            },
          ),
        ]),
   ],
  errorBuilder: (context, state) => const NotFoundScreen(),
  ); 
  ```
 - GoRouterState sınıfı, mevcut sayfa rotası durumu hakkında bilgi sağlar. Bu durum, yönlendirme işlemi sırasında geçirilen verileri içerir.

 - main.dart içinde  MaterialApp.router kulanarak routerConfig parametresini GoRouter yapılandırma nesnenize ayarlıyoruz.
    ```
     class MyApp extends StatelessWidget {
       @override
       Widget build(BuildContext context) {
        return MaterialApp.router(
         routerConfig: _router,
        );
       }
     }
     ``` 

-  Path, sayfanın URL'sindeki yolunu name ise sayfaları tanımlayan bir isim veya etiket diyebiliriz bu özellikleri sayfaları çağırırken veya gezinirken kulanırız örneğin PlayerScreen sayfasında kullandığımız yönlendirme gibi,

   ```
   context.go("/playerDetailScreen",extra:resultPlayer);
    ```
- Projede PlayerDetailScreen sayfası Player modeli olan parametre içerdiği için GoRouter yapılandırmasının yapıldığı yerde sayfa rotasına eklenen verileri almak için nesnesi 'Player' olan state.extra kullanırız.Bu yöntem, sayfalar arasında veri iletişimi yapmak ve belirli sayfaları dinamik verilerle oluşturmak için kullanışlıdır.

   ```
   GoRoute(
            name: 'playerDetailScreen',
            path: 'playerDetailScreen',
            builder: (BuildContext context, GoRouterState state) {
              Player player = state.extra as Player;
              return PlayerDetailsScreen(player: player);
            },
     )
   ```

   Ayrıca sayfa, veri tipi String olan bir parametre içerirse  ```state.pathParameters["name"]``` şeklinde kullanılır.
   İnteger bir parametre içerirse  ```id: int.parse(state.pathParameters['id']!``` şeklinde kullanılır. Bu işlemleri yaptıktan sonra
   yönlendirdiğimiz yerde  parametreyi **extra**  diyerek vermemiz gerekir aşağıdaki örnek gibi,
   ```
    context.go("/playerDetailScreen",extra:resultPlayer); 
   ``` 
  
