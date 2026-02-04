# Airdrop Documents 🚀

Ứng dụng truyền tải tập tin tốc độ cao giữa các thiết bị trên cùng mạng nội bộ (mDNS/mDSN), hỗ trợ đa nền tảng Windows, Android và iOS. Dự án được xây dựng với Flutter, tuân thủ các tiêu chuẩn thiết kế hiện đại và kiến trúc sạch (Clean Architecture).

---

## 🌟 Tính năng nổi bật

- **Tự động phát hiện (Auto-Discovery)**: Nhờ giao thức NSD (mDNS), các thiết bị trong cùng mạng Wi-Fi sẽ tự động tìm thấy nhau mà không cần cấu hình IP thủ công.
- **Chế độ Nhận Tự động (Auto-Receive)**: Ngay khi mở ứng dụng, máy của bạn sẽ sẵn sàng nhận file ở chế độ nền.
- **Xác nhận bảo mật (Handshake Protocol)**: Người nhận phải xác nhận **Accept** hoặc **Reject** trước khi quá trình truyền dữ liệu bắt đầu.
- **Tốc độ Warp**: Sử dụng TCP Sockets trực tiếp để đạt tốc độ truyền tải tối đa của hệ thống mạng.
- **Giao diện Adaptive**: Tự động thay đổi bố cục (Layout) linh hoạt giữa Mobile và Desktop (Windows).
- **Thiết kế Glassmorphism**: Giao diện hiện đại, bóng bẩy với các hiệu ứng kính mờ và gradient cao cấp.

---

## 🛠 Công nghệ sử dụng

- **Framework**: Flutter
- **Quản lý trạng thái (State Management)**: Riverpod 3.x (Declarative & Functional)
- **Kiến trúc**: MVVM + Clean Architecture
- **Điều hướng (Routing)**: AutoRoute
- **Tiêm phụ thuộc (DI)**: GetIt & Injectable
- **Mô hình dữ liệu**: Freezed (Immutability)
- **Giao thức mạng**: NSD (mDNS) & TCP Sockets

---

## 🖥 Hỗ trợ nền tảng

- **Windows**: Hỗ trợ giao diện Desktop với Sidebar (NavigationRail), lưu file trực tiếp vào thư mục `Downloads`.
- **Android**: Yêu cầu quyền truy cập mạng nội bộ và bộ nhớ (đối với Android cũ).
- **iOS**: Yêu cầu khai báo `NSLocalNetworkUsageDescription` và `NSBonjourServices`.

---

## 🚀 Hướng dẫn cài đặt & Chạy ứng dụng

### 1. Yêu cầu hệ thống
- Flutter SDK (phiên bản mới nhất được khuyến nghị).
- Dart SDK.

### 2. Cấu hình dự án
```bash
# Lấy các dependencies
flutter pub get

# Chạy code generation (Riverpod, AutoRoute, Freezed)
dart run build_runner build --delete-conflicting-outputs
```

### 3. Cài đặt App Icon (Launcher Icons)
Nếu bạn thay đổi logo, hãy chạy lệnh sau để cập nhật icon cho tất cả nền tảng:
```bash
dart run flutter_launcher_icons
```

### 4. Chạy ứng dụng
```bash
flutter run
```

---

## 📁 Cấu trúc thư mục chính

- `lib/core`: Chứa cấu hình Router, DI, Theme và các tiện ích dùng chung.
- `lib/features/discovery`: Xử lý việc phát hiện và quảng bá thiết bị trên mạng nội bộ.
- `lib/features/transfer`: Logic truyền dữ liệu TCP (Client & Server) và Confirmation Handshake.
- `lib/features/home`: Giao diện chính với logic Adaptive Layout.

---

## 🛡 Bảo mật và Quyền lợi
- Dữ liệu được truyền trực tiếp qua P2P, không lưu trữ qua Cloud server trung gian.
- Luôn hiển thị thông báo xác nhận trước khi nhận tập tin lạ.

---

