Hướng dẫn cài đặt và chạy ứng dụng

Shop smart là một ứng dụng thương mại điện tử được phát triển bằng Flutter cho giao diện người dùng và Firebase cho backend. Dưới đây là hướng dẫn chi tiết về cách cài đặt và chạy ứng dụng trên cả Android và iOS.

1. Yêu cầu hệ thống
Trước khi bắt đầu, bạn cần đảm bảo các công cụ sau đã được cài đặt:
Flutter SDK: Cài đặt Flutter từ trang chính thức: Flutter SDK.
Firebase CLI: Cài đặt Firebase CLI bằng lệnh npm install -g firebase-tools nếu chưa có.
Android Studio (hoặc Xcode cho macOS): Để phát triển và chạy ứng dụng trên Android (hoặc iOS).

2. Cấu hình Backend với Firebase
   
2.1. Tạo dự án Firebase
Truy cập Firebase Console.
Tạo một dự án mới.
Kích hoạt các dịch vụ sau cho dự án:
Firestore: Để lưu trữ dữ liệu người dùng, sản phẩm, và đơn hàng.
Authentication: Để xác thực người dùng qua email/mật khẩu và Google.
Storage: Để lưu trữ hình ảnh (ảnh sản phẩm, ảnh đại diện người dùng).
Cloud Functions: Để xử lý các tác vụ như thanh toán và thông báo.

2.2. Cài đặt Firebase CLI
Cài đặt Firebase CLI bằng lệnh:
npm install -g firebase-tools

Đăng nhập vào Firebase CLI:
firebase login

Sử dụng lệnh firebase init để thiết lập dự án Firebase của bạn với các dịch vụ Firestore, Functions và Storage.

3. Cấu hình Frontend với Flutter
3.1. Cài đặt các phụ thuộc
Mở thư mục dự án Flutter 
Chạy lệnh sau để cài đặt tất cả các phụ thuộc cần thiết:
  firebase_core: ^3.7.0
  firebase_auth: ^5.3.2
  cloud_firestore: ^5.4.5
  firebase_storage: ^12.3.5
  google_sign_in: ^6.2.2


3.2. Cấu hình tự động Firebase cho ứng dụng
Truy cập lại Firebase Console chọn flutter .
sau đó coppy link ở Then, at the root of your Flutter project directory, run this command và dán vào terminal ở trong dự án và nhấn enter

Chọn các nền tảng(ví dụ ios và android) sau đó đặt tên giống với (android/app/build.gradle)
  -ví dụ trong applicationId = "com.example.user" thì sẽ phải đặt tên là com.example.user
Đợi nó hoàn thành 

3.3. Chạy ứng dụng
Kết nối thiết bị Android hoặc iOS của bạn.
Sử dụng lệnh dưới đây để chạy ứng dụng trên thiết bị:
flutter run
4. Các tính năng chính của ứng dụng
4.1. Người dùng
Xem sản phẩm: Duyệt các sản phẩm trong ứng dụng.
Thêm vào giỏ hàng và yêu thích: Thêm sản phẩm vào giỏ hàng hoặc danh sách yêu thích.
Đặt hàng và thanh toán: Đặt đơn hàng và thanh toán qua
Quản lý tài khoản: Tạo tài khoản, đăng nhập và quản lý hồ sơ cá nhân (bao gồm tải lên ảnh đại diện).
Khôi phục mật khẩu: Đặt lại mật khẩu qua email khi người dùng quên.
4.2. Quản trị viên
Quản lý sản phẩm: Thêm, sửa, xóa sản phẩm.
Quản lý đơn hàng: Theo dõi và cập nhật trạng thái đơn hàng.

