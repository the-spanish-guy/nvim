// Theme Preview Sample

const TIMEOUT = 3000
const API_URL = "https://api.example.com"

interface Animal {
  kind: string
  sound: string
}

type FetchResult<T> = {
  status: number
  data: T | null
  error?: string
}

class Dog implements Animal {
  kind = "dog"
  sound = "woof"

  speak(): string {
    return `The ${this.kind} says: ${this.sound}`
  }
}

function greet(name: string, opts?: { loud?: boolean }): string {
  if (!name) throw new Error("name cannot be empty")

  const msg = `Hello, ${name}!`
  return opts?.loud ? msg.toUpperCase() : msg
}

async function fetchData<T>(url: string): Promise<FetchResult<T>> {
  const controller = new AbortController()
  const timer = setTimeout(() => controller.abort(), TIMEOUT)

  try {
    const res = await fetch(url, { signal: controller.signal })

    if (!res.ok) {
      return { status: res.status, data: null, error: res.statusText }
    }

    const data = (await res.json()) as T
    return { status: res.status, data }
  } catch (err) {
    return { status: 0, data: null, error: String(err) }
  } finally {
    clearTimeout(timer)
  }
}

const items = ["apple", "banana", "cherry"]

const formatted = items
  .map((item) => item[0].toUpperCase() + item.slice(1))
  .filter((item) => item.length > 5)

// TODO: add pagination support
// FIXME: error boundary missing
async function main() {
  const dog = new Dog()
  console.log(dog.speak())
  console.log(greet("world", { loud: true }))

  const result = await fetchData<{ items: string[] }>(API_URL + "/data")

  if (result.error) {
    console.error("Error:", result.error)
    return
  }

  console.log("Items:", formatted)
}

main()
