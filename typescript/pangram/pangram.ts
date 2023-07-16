export function isPangram(value: string): boolean {
  if (value === '') return false

  // Remove non-alpha characters and transform to lowercase
  const sanitised_value = value.replace(/[^a-z]/gi, '').toLowerCase()
  const alphabet = 'abcdefghijklmnopqrstuvwxyz'

  if (sanitised_value === alphabet) return true

  const alphabet_characters = alphabet.split('')
  // Create alphabetically sorted array of characters from given string
  const sanitised_value_characters = sanitised_value.split('').sort((a, b) => a.localeCompare(b))
  // Remove duplicate letters from the array
  const unique_value_characters = [...new Set(sanitised_value_characters)]

  // Check if arrays contain the exact same number of letters
  if (unique_value_characters.length === alphabet_characters.length) {
    // Check if arrays' values are identical
    if (unique_value_characters.every((e, i) => e === alphabet_characters[i])) return true
  }

  return false
}
