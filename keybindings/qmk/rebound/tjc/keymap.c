#include QMK_KEYBOARD_H

// Each layer gets a name for readability, which is then used in the keymap matrix below.
// The underscores don't mean anything - you can have a layer called STUFF or any other name.
// Layer names don't all need to be of the same length, obviously, and you can also skip them
// entirely and just use numbers.

enum layer_names {
  _QWERTY,
  _COLEMAK,
  _DVORAK,
  _LOWER,
  _RAISE,
  _ADJUST
};

enum custom_keycodes {
  QWERTY = SAFE_RANGE,
  COLEMAK,
  DVORAK
};

#define LOWER  MO(_LOWER)
#define RAISE  MO(_RAISE)
#define ADJUST MO(_ADJUST)

// Tap Dance Declarations
enum {
  TD_GUI_ENT,
};

// Tap Dance Definitions
qk_tap_dance_action_t tap_dance_actions[] = {
  // Tap once for GUI, twice for Enter
  [TD_GUI_ENT] = ACTION_TAP_DANCE_DOUBLE(KC_LGUI, KC_ENT),
  // other declarations would go here, separated by commas, if you have them
};

#define GUI_ENT TD(TD_GUI_ENT)
#define SFT_ENT SFT_T(KC_ENT)
#define CTL_LFT LCTL(KC_LEFT)
#define CTL_RGT LCTL(KC_RGHT)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

[_QWERTY] = LAYOUT_all(
   KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,            KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_BSLS,
   KC_ESC,  KC_A,    KC_S,    KC_D,    KC_F,    KC_G,   KC_VOLU, KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT,
   KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,   KC_VOLD, KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, SFT_ENT,
   KC_LCTL, KC_HYPR, KC_LALT, GUI_ENT, LOWER,   KC_SPC, KC_MUTE, KC_BSPC, RAISE,   KC_RALT, KC_MEH,  KC_F3,   KC_RSFT
),

[_COLEMAK] = LAYOUT_all(
  KC_TAB,  KC_Q,    KC_W,    KC_F,    KC_P,    KC_G,             KC_J,    KC_L,    KC_U,    KC_Y,    KC_SCLN, KC_BSPC,
  KC_ESC,  KC_A,    KC_R,    KC_S,    KC_T,    KC_D,   _______,  KC_H,    KC_N,    KC_E,    KC_I,    KC_O,    KC_QUOT,
  KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,   _______,  KC_K,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_ENT,
  ADJUST,  KC_LCTL, KC_LALT, KC_LGUI, LOWER,   KC_SPC, _______,  KC_SPC,  RAISE,   KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT
),

[_DVORAK] = LAYOUT_all(
  KC_TAB,  KC_QUOT, KC_COMM, KC_DOT,  KC_P,    KC_Y,             KC_F,    KC_G,    KC_C,    KC_R,    KC_L,    KC_BSPC,
  KC_ESC,  KC_A,    KC_O,    KC_E,    KC_U,    KC_I,   _______,  KC_D,    KC_H,    KC_T,    KC_N,    KC_S,    KC_SLSH,
  KC_LSFT, KC_SCLN, KC_Q,    KC_J,    KC_K,    KC_X,   _______,  KC_B,    KC_M,    KC_W,    KC_V,    KC_Z,    KC_ENT,
  ADJUST,  KC_LCTL, KC_LALT, KC_LGUI, LOWER,   KC_SPC, _______,  KC_SPC,  RAISE,   KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT
),

[_LOWER] = LAYOUT_all(
  KC_GRV,  KC_SLSH, KC_7,    KC_8,    KC_9,    S(KC_8),          _______, KC_LCBR, KC_LBRC, KC_RBRC, KC_RCBR, _______,
  _______, KC_MINS, KC_4,    KC_5,    KC_6,   S(KC_EQL),_______, _______, _______, KC_LPRN, KC_RPRN,S(KC_MINS),_______,
  _______, KC_DOT,  KC_1,    KC_2,    KC_3,    KC_EQL,  _______, _______, _______, KC_LABK, KC_RABK, _______, _______,
  _______, KC_COMM, KC_0,    KC_0,    _______, _______, _______, _______, _______, _______, _______, _______, _______
),

[_RAISE] = LAYOUT_all(
  _______, _______, CTL_RGT, CTL_RGT, _______, _______,          _______, KC_PGUP, _______, _______, KC_PSCR, _______,
  _______, KC_MINS, KC_END,  KC_PGDN, KC_HOME, _______, _______, KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT,S(KC_MINS),_______,
  _______, _______, KC_DEL,  _______, _______, CTL_LFT, _______, _______, _______, KC_MRWD, KC_MFFD, KC_MPLY, _______,
  _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_VOLD, KC_VOLU, KC_MUTE, _______
),

[_ADJUST] =  LAYOUT_all(
  _______, KC_F12,  KC_F7,   KC_F8,   KC_F9,   _______,          KC_WH_L, KC_WH_D, KC_WH_U, KC_WH_R, KC_BTN1, KC_ACL2,
  _______, KC_F11,  KC_F4,   KC_F5,   KC_F6,   _______, _______, KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, KC_BTN2, KC_ACL1,
  KC_CAPS, KC_F10,  KC_F1,   KC_F2,   KC_F3,   _______, _______, AU_OFF,  AU_ON,   MU_OFF,  MU_ON,   _______, KC_ACL0,
  _______, _______, _______, _______, _______, _______, _______, _______, _______, QWERTY,  _______, _______, _______
)
};

layer_state_t layer_state_set_user(layer_state_t state) {
    return update_tri_layer_state(state, _LOWER, _RAISE, _ADJUST);
}
bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case QWERTY:
            if (record->event.pressed) {
                set_single_persistent_default_layer(_QWERTY);
             }
             break;
        case COLEMAK:
            if (record->event.pressed) {
                set_single_persistent_default_layer(_COLEMAK);
            }
            break;
        case DVORAK:
            if (record->event.pressed) {
                set_single_persistent_default_layer(_DVORAK);
            }
            break;
    }
    return true;
}

void encoder_update_user(uint8_t index, bool clockwise) {
    if (clockwise) {
      tap_code16(S(KC_VOLD));
    } else {
      tap_code16(KC_VOLU);
    }
}
