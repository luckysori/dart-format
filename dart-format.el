;;; dart-format.el --- Reformat using dart format  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Lucas Soriano

;; Author: Lucas Soriano <lucas_soriano@fastmail.com>
;; Keywords: languages
;; URL: https://github.com/luckysori/dart-format
;; Package-Requires: ((emacs "24.3") (reformatter "0.3"))
;; Version: 0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Provides commands and a minor mode for reformatting files using
;; `dart''s `format' command.

;; This package depends on the presence of the `dart' binary.

;; You can customise `dart-format-command' if you want to specify which
;; `dart' binary to use.

;; Enable `dart-format-on-save-mode' locally to your project with a
;; form in your `.dir-locals.el' like this:

;; ((prog-mode . ((eval . (dart-format-on-save-mode)))))

;;; Code:

(require 'reformatter)

(defcustom dart-format-command "dart"
  "Command used for reformatting."
  :type 'string
  :group 'dart-format)

(reformatter-define
 dart-format
 :program dart-format-command
 :args
 (list
  "format" "-o" "show" input-file "--fix" "--summary" "none"
  ;; TODO: Do not hard-code line-length.
  "--line-length" "100")
 :input-file (reformatter-temp-file-in-current-directory)
 :lighter " dart-format"
 :group 'dart-format)

(provide 'dart-format)
;;; dart-format.el ends here
