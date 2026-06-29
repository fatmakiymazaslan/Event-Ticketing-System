import customtkinter as ctk
import pymysql

# Arayüz Ayarları (Rapor Tasarımına Uygun - Pastel Pink & White)
ctk.set_appearance_mode("light")
ctk.set_default_color_theme("blue")

class EventTicketingApp(ctk.CTk):
    def __init__(self):
        super().__init__()
        
        self.title("Event Tracking and Ticketing System")
        self.geometry("900x500")
        self.configure(fg_color="#FFF5F7") # Raporlanan Pastel Pembe Tema
        
        # Ana Başlık
        self.title_label = ctk.CTkLabel(self, text="Event Ticketing Automation", font=("Helvetica", 24, "bold"), text_color="#333333")
        self.title_label.pack(pady=20)
        
        # Yan Yana Paneller için Frame (Raporda belirtilen mimari)
        self.main_frame = ctk.CTkFrame(self, fg_color="transparent")
        self.main_frame.pack(fill="both", expand=True, padx=20, pady=10)
        
        # Satış Paneli (Sol)
        self.sales_panel = ctk.CTkFrame(self.main_frame, fg_color="white", corner_radius=15)
        self.sales_panel.pack(side="left", fill="both", expand=True, padx=10)
        
        ctk.CTkLabel(self.sales_panel, text="Ticket Sales Panel", font=("Helvetica", 16, "bold")).pack(pady=10)
        ctk.CTkButton(self.sales_panel, text="Sell Ticket", command=self.dummy_action).pack(pady=10)
        
        # İptal Paneli (Sağ)
        self.cancel_panel = ctk.CTkFrame(self.main_frame, fg_color="white", corner_radius=15)
        self.cancel_panel.pack(side="right", fill="both", expand=True, padx=10)
        
        ctk.CTkLabel(self.cancel_panel, text="Cancellation Panel", font=("Helvetica", 16, "bold")).pack(pady=10)
        ctk.CTkButton(self.cancel_panel, text="Cancel Ticket", fg_color="#ff4d4d", hover_color="#cc0000", command=self.dummy_action).pack(pady=10)
        
    def dummy_action(self):
        print("Veri tabanı bağlantısı sağlandığında bu işlem çalışacak.")

if __name__ == "__main__":
    app = EventTicketingApp()
    app.mainloop()