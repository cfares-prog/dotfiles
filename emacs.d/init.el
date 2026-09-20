(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
     default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Add MELPA to package archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org") t)
(package-initialize)

;; Install and activate Evil mode
(unless (package-installed-p 'evil)
  (package-refresh-contents)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)
(require 'evil)
(evil-mode 1)
(with-eval-after-load 'evil
  (setq evil-default-state-cursor '(box)))


(setq inhibit-startup-screen t)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(setq-default cursor-type 'box)
