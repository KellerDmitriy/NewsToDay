import SwiftUI

// MARK: - DS (Design System)
/// Design System for the app
public enum DS {
    /// Палитра цветов NewsToDay
    public enum Colors {
        /// Тема которая содержит основные цвета.
        public enum Theme {
            /// Белый акцентный цвет.
            public static let whiteAccent = Color(hex: "#FFFFFF")
            /// Индиговый акцентный цвет.
            public static let indigoAccent = Color(hex: "#475AD7")
            /// Основной цвет текста.
            public static let primaryText = Color(hex: "#333647")
            /// Второстепенный цвет текста.
            public static let secondaryText = Color(hex: "#7C82A1")
            public static let grayLight = Color(hex: "#ACAFC3")
            /// Цвет текста кнопки.
            public static let buttonText = Color(hex: "#666C8E")
            /// Цвет фона кнопки.
            public static let buttonBackground = Color(hex: "#13353F2B")
        }
    }
    
    public enum Fonts {
        /// Inter font size 48
        public enum Inter48 {
            /// Bold Inter font size 48
            public static let bold700 = Font.custom("Inter-Bold", size: 48)
            /// ExtraBold Inter font size 48
            public static let extraBold = Font.custom("Inter-ExtraBold", size: 48)
            /// Black Inter font size 48
            public static let black = Font.custom("Inter-Black", size: 48)
        }
        
        /// Inter font size 36
        public enum Inter36 {
            /// Bold Inter font size 36
            public static let bold700 = Font.custom("Inter-Bold", size: 36)
            /// ExtraBold Inter font size 36
            public static let extraBold = Font.custom("Inter-ExtraBold", size: 36)
            /// Black Inter font size 36
            public static let black = Font.custom("Inter-Black", size: 36)
        }
        
        /// Inter font size 28
        public enum Inter28 {
            /// Bold Inter font size 28
            public static let bold700 = Font.custom("Inter-Bold", size: 28)
            /// ExtraBold Inter font size 28
            public static let extraBold = Font.custom("Inter-ExtraBold", size: 28)
            /// Black Inter font size 28
            public static let black = Font.custom("Inter-Black", size: 28)
        }
        
        /// Inter font size 24
        public enum Inter24 {
            /// Bold Inter font size 24
            public static let bold700 = Font.custom("Inter-Bold", size: 24)
            /// ExtraBold Inter font size 24
            public static let extraBold = Font.custom("Inter-ExtraBold", size: 24)
            /// Black Inter font size 24
            public static let black = Font.custom("Inter-Black", size: 24)
            /// SemiBold Inter font size 24
            public static let semiBold600 = Font.custom("Inter-SemiBold", size: 24)
            /// Medium Inter font size 24
            public static let medium500 = Font.custom("Inter-Medium", size: 24)
            /// Regular Inter font size 24
            public static let regular400 = Font.custom("Inter-Regular", size: 24)
            /// Light Inter font size 24
            public static let light300 = Font.custom("Inter-Light", size: 24)
            /// ExtraLight Inter font size 24
            public static let extraLight = Font.custom("Inter-ExtraLight", size: 24)
            /// Thin Inter font size 24
            public static let thin = Font.custom("Inter-Thin", size: 24)
        }
        
        /// Inter font size 20
        public enum Inter20 {
            /// Bold Inter font size 20
            public static let bold700 = Font.custom("Inter-Bold", size: 20)
            /// ExtraBold Inter font size 20
            public static let extraBold = Font.custom("Inter-ExtraBold", size: 20)
            /// Black Inter font size 20
            public static let black = Font.custom("Inter-Black", size: 20)
            /// SemiBold Inter font size 20
            public static let semiBold600 = Font.custom("Inter-SemiBold", size: 20)
            /// Medium Inter font size 20
            public static let medium500 = Font.custom("Inter-Medium", size: 20)
            /// Regular Inter font size 20
            public static let regular400 = Font.custom("Inter-Regular", size: 20)
            /// Light Inter font size 20
            public static let light300 = Font.custom("Inter-Light", size: 20)
            /// ExtraLight Inter font size 20
            public static let extraLight = Font.custom("Inter-ExtraLight", size: 20)
            /// Thin Inter font size 20
            public static let thin = Font.custom("Inter-Thin", size: 20)
        }
        
        /// Inter font size 18
        public enum Inter18 {
            /// Bold Inter font size 18
            public static let bold700 = Font.custom("Inter-Bold", size: 18)
            /// ExtraBold Inter font size 18
            public static let extraBold = Font.custom("Inter-ExtraBold", size: 18)
            /// Black Inter font size 18
            public static let black = Font.custom("Inter-Black", size: 18)
            /// SemiBold Inter font size 18
            public static let semiBold600 = Font.custom("Inter-SemiBold", size: 18)
            /// Medium Inter font size 18
            public static let medium500 = Font.custom("Inter-Medium", size: 18)
            /// Regular Inter font size 18
            public static let regular400 = Font.custom("Inter-Regular", size: 18)
            /// Light Inter font size 18
            public static let light300 = Font.custom("Inter-Light", size: 18)
            /// ExtraLight Inter font size 18
            public static let extraLight = Font.custom("Inter-ExtraLight", size: 18)
            /// Thin Inter font size 18
            public static let thin = Font.custom("Inter-Thin", size: 18)
        }
        
        /// Inter font size 16
        public enum Inter16 {
            /// Bold Inter font size 16
            public static let bold700 = Font.custom("Inter-Bold", size: 16)
            /// ExtraBold Inter font size 16
            public static let extraBold = Font.custom("Inter-ExtraBold", size: 16)
            /// Black Inter font size 16
            public static let black = Font.custom("Inter-Black", size: 16)
            /// SemiBold Inter font size 16
            public static let semiBold600 = Font.custom("Inter-SemiBold", size: 16)
            /// Medium Inter font size 16
            public static let medium500 = Font.custom("Inter-Medium", size: 16)
            /// Regular Inter font size 16
            public static let regular400 = Font.custom("Inter-Regular", size: 16)
            /// Light Inter font size 16
            public static let light300 = Font.custom("Inter-Light", size: 16)
            /// ExtraLight Inter font size 16
            public static let extraLight = Font.custom("Inter-ExtraLight", size: 16)
            /// Thin Inter font size 16
            public static let thin = Font.custom("Inter-Thin", size: 16)
        }
        
        /// Inter font size 14
        public enum Inter14 {
            /// Bold Inter font size 14
            public static let bold700 = Font.custom("Inter-Bold", size: 14)
            /// ExtraBold Inter font size 14
            public static let extraBold = Font.custom("Inter-ExtraBold", size: 14)
            /// Black Inter font size 14
            public static let black = Font.custom("Inter-Black", size: 14)
            /// SemiBold Inter font size 14
            public static let semiBold600 = Font.custom("Inter-SemiBold", size: 14)
            /// Medium Inter font size 14
            public static let medium500 = Font.custom("Inter-Medium", size: 14)
            /// Regular Inter font size 14
            public static let regular400 = Font.custom("Inter-Regular", size: 14)
            /// Light Inter font size 14
            public static let light300 = Font.custom("Inter-Light", size: 14)
            /// ExtraLight Inter font size 14
            public static let extraLight = Font.custom("Inter-ExtraLight", size: 14)
            /// Thin Inter font size 14
            public static let thin = Font.custom("Inter-Thin", size: 14)
        }
        
        /// Inter font size 12
        public enum Inter12 {
            /// Bold Inter font size 12
            public static let bold700 = Font.custom("Inter-Bold", size: 12)
            /// ExtraBold Inter font size 12
            public static let extraBold = Font.custom("Inter-ExtraBold", size: 12)
            /// Black Inter font size 12
            public static let black = Font.custom("Inter-Black", size: 12)
            /// SemiBold Inter font size 12
            public static let semiBold600 = Font.custom("Inter-SemiBold", size: 12)
            /// Medium Inter font size 12
            public static let medium500 = Font.custom("Inter-Medium", size: 12)
            /// Regular Inter font size 12
            public static let regular400 = Font.custom("Inter-Regular", size: 12)
            /// Light Inter font size 12
            public static let light300 = Font.custom("Inter-Light", size: 12)
            /// ExtraLight Inter font size 12
            public static let extraLight = Font.custom("Inter-ExtraLight", size: 12)
            /// Thin Inter font size 12
            public static let thin = Font.custom("Inter-Thin", size: 12)
        }
        
        public static let largeTitle = UIFont(name: "Inter-SemiBold", size: 24)
    }
}
